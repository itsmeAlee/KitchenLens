# KitchenLens — AI Stack Integration Guide

**Date:** February 20, 2026
**Topic:** Integrating Python AI Microservice (FastAPI, LangChain, LangGraph) with Flutter & Appwrite

---

## 1. Architectural Overview

To leverage Python's rich ecosystem for AI (FastAPI, LangChain, LangGraph) while maintaining the robust Appwrite backend and Flutter frontend, we recommend a **Event-Driven Microservice Architecture**.

### The Stack

*   **Frontend:** Flutter (Mobile App)
*   **Backend-as-a-Service (BaaS):** Appwrite (Auth, Database, Storage, Realtime)
*   **AI Service:** Python (FastAPI + LangGraph) running on a container service (e.g., Docker/K8s)

### High-Level Data Flow

1.  **Capture & Upload:** Flutter app records video/photo and uploads directly to **Appwrite Storage**.
2.  **Trigger:** Appwrite detects the new file and sends a **Webhook** (HTTP POST) to the Python AI Service.
3.  **Process:** The Python Service receives the webhook, downloads the file using the **Appwrite Python SDK**, and runs the **LangGraph** agent pipeline.
4.  **Update:** The Python Service writes the results (ingredients, recipes) back to the **Appwrite Database** using the SDK.
5.  **Notify:** Appwrite **Realtime** automatically pushes the database updates to the Flutter app.

---

## 2. Integration Details

### Step 1: Frontend (Flutter) — Uploading Media

The Flutter app remains responsible for user interaction and media capture. It does **not** communicate directly with the AI Service.

```dart
// 1. Create a "Scan Session" document in Appwrite Database
final session = await databases.createDocument(
  databaseId: 'kitchenlens',
  collectionId: 'scans',
  documentId: ID.unique(),
  data: {'status': 'uploading', 'user_id': userId},
);

// 2. Upload the file to Appwrite Storage
final file = await storage.createFile(
  bucketId: 'videos',
  fileId: ID.unique(),
  file: InputFile.fromPath(path: videoPath),
);

// 3. Update the session with the file ID -> triggers the AI
await databases.updateDocument(
  databaseId: 'kitchenlens',
  collectionId: 'scans',
  documentId: session.$id,
  data: {'status': 'pending', 'file_id': file.$id},
);
```

### Step 2: Appwrite — Webhook Configuration

In the Appwrite Console, set up a webhook to notify your Python service when a document in the `scans` collection is updated or created.

*   **Events:** `databases.[db-id].collections.scans.documents.create`, `databases.[db-id].collections.scans.documents.update`
*   **POST URL:** `https://your-python-service.com/webhook/scan-created`
*   **Security:** Set a `Signature Key` to verify requests in FastAPI.

### Step 3: AI Service (Python/FastAPI) — The Brain

The Python service acts as a worker. It exposes a single endpoint to receive Appwrite events.

**Tech Stack:**
*   **FastAPI:** Web framework.
*   **Appwrite Python SDK:** To read/write data to Appwrite.
*   **LangGraph:** To orchestrate the multi-agent flow (Planner -> Vision -> Chef).
*   **Pydantic:** To validate the webhook payload and agent outputs.

#### Example `main.py` Structure

```python
from fastapi import FastAPI, Request, BackgroundTasks
from appwrite.client import Client
from appwrite.services.databases import Databases
from appwrite.services.storage import Storage
import os

app = FastAPI()

# Initialize Appwrite SDK
client = Client()
client.set_endpoint(os.getenv('APPWRITE_ENDPOINT'))
client.set_project(os.getenv('APPWRITE_PROJECT_ID'))
client.set_key(os.getenv('APPWRITE_API_KEY')) # Server-side API Key

databases = Databases(client)
storage = Storage(client)

@app.post("/webhook/scan-created")
async def handle_scan_event(request: Request, background_tasks: BackgroundTasks):
    payload = await request.json()

    # 1. Validate Event Type (we only want 'pending' scans)
    if payload['events'][0].endswith('.create') or payload['events'][0].endswith('.update'):
        scan_doc = payload['payload']
        if scan_doc['status'] == 'pending':
            # 2. Offload processing to background task (don't block the webhook)
            background_tasks.add_task(process_scan, scan_doc)

    return {"status": "accepted"}

async def process_scan(scan_doc):
    scan_id = scan_doc['$id']
    file_id = scan_doc['file_id']

    # 3. Update status to 'processing'
    databases.update_document(
        database_id='kitchenlens',
        collection_id='scans',
        document_id=scan_id,
        data={'status': 'processing'}
    )

    try:
        # 4. Download file (video/image) to temp storage
        result = storage.get_file_download(bucket_id='videos', file_id=file_id)
        file_path = f"/tmp/{file_id}.mp4"
        with open(file_path, 'wb') as f:
            f.write(result)

        # 5. RUN LANGGRAPH AGENT PIPELINE
        # This is where your LangGraph agents (Planner, Vision, Chef) take over.
        # They will analyze the file and return structured data.
        agent_output = run_langgraph_pipeline(file_path)
        # Output example: {'ingredients': [...], 'recipes': [...]}

        # 6. Save Results to Appwrite
        databases.update_document(
            database_id='kitchenlens',
            collection_id='scans',
            document_id=scan_id,
            data={
                'status': 'complete',
                'ingredients': agent_output['ingredients'],
                'recipes': agent_output['recipes']
            }
        )

    except Exception as e:
        # Handle failures
        databases.update_document(
            database_id='kitchenlens',
            collection_id='scans',
            document_id=scan_id,
            data={'status': 'failed', 'error': str(e)}
        )
```

### Step 4: Frontend (Flutter) — Realtime Updates

The Flutter app subscribes to the `scans` collection. When the Python service updates the document status to `complete`, the app automatically receives the new data.

```dart
final realtime = Realtime(client);
final subscription = realtime.subscribe([
  'databases.kitchenlens.collections.scans.documents.$scanId'
]);

subscription.stream.listen((event) {
  if (event.payload['status'] == 'complete') {
    // Navigate to results page with new data
  }
});
```

---

## 3. Why This Architecture?

1.  **Mobile-Optimized (Latency):** Direct API calls from mobile to Python for video processing would require keeping a connection open for 30s+, which is fragile on cellular networks. By uploading to Appwrite Storage first (which handles resumes/retries natively) and using Webhooks, the mobile app can "fire and forget."
2.  **Decoupled:** The frontend acts as a "dumb client" that only knows about Appwrite. It doesn't need to manage the complexity of the AI service's endpoints or load balancing.
3.  **Scalable:** The Python service is stateless (state is in Appwrite DB/Storage). You can scale the Python workers independently of the Appwrite backend.
4.  **Secure:** The Python service uses a server-side API Key. The frontend only uses user-scoped JWTs, keeping your backend logic private.

## 5. Recommended Enhancements for Speed & Scalability

To make your app "fast and better," consider integrating these additional frameworks into your Python stack:

### A. Task Queue: Celery or Arq + Redis
**Problem:** `BackgroundTasks` in FastAPI is simple but risky. If the server restarts, tasks are lost. Video processing is heavy and long-running.
**Solution:** Use **Celery** or **Arq** (a lighter async alternative) backed by **Redis**.
*   **Why:** Ensures tasks are persisted. If a worker crashes, the job is retried. It allows you to run expensive video processing on separate "heavy" worker nodes while keeping your FastAPI nodes lightweight.

### B. LLM Routing: LiteLLM
**Problem:** You might want to switch between Gemini, OpenAI, or Anthropic for different agents (e.g., Gemini for Vision, GPT-4o for Planning) or handle rate limits.
**Solution:** **LiteLLM**.
*   **Why:** It provides a unified interface for 100+ LLMs. It handles fallback logic (e.g., "If Gemini 429s, try GPT-4") automatically, making your app more resilient.

### C. Prompt Optimization: DSPy
**Problem:** Manually tuning prompts for LangChain agents can be brittle.
**Solution:** **DSPy**.
*   **Why:** Instead of writing string prompts, you write code. DSPy "compiles" your pipeline by automatically optimizing the prompts based on examples. It can significantly improve the accuracy of your Planner and Chef agents.

### D. Video Processing: FFmpeg (Python Wrapper)
**Problem:** Native Python video libraries can be slow.
**Solution:** **ffmpeg-python**.
*   **Why:** Use it to extract keyframes or downscale video on the server side *before* sending frames to the Vision Agent. This reduces the token cost and latency of the LLM call.

## 6. Next Steps

1.  **Deploy Appwrite:** Ensure you have a project set up.
2.  **Develop Python Service:**
    *   Set up a new repo or folder `backend-ai`.
    *   Install `fastapi`, `uvicorn`, `appwrite`, `langchain`, `langgraph`, `celery`, `redis`.
    *   Implement the `process_scan` logic.
3.  **Configure Webhooks:** Point Appwrite to your local tunnel (e.g., Ngrok) for testing, then to your production URL.
