# KitchenLens — Product & Technical Requirements Document

**Version:** 1.0.0
**Date:** February 20, 2026
**Author:** KitchenLens Architecture Team
**Status:** Active

---

## Table of Contents

1. [Product Overview](#1-product-overview)
2. [User Stories & Acceptance Criteria](#2-user-stories--acceptance-criteria)
3. [AI Strategy — Agentic Multi-Pipeline Architecture](#3-ai-strategy--agentic-multi-pipeline-architecture)
4. [Video Optimization Requirements](#4-video-optimization-requirements)
5. [Tech Stack Specification](#5-tech-stack-specification)
6. [Flutter Package Manifest](#6-flutter-package-manifest)
7. [Data Models](#7-data-models)
8. [API & Integration Requirements](#8-api--integration-requirements)
9. [Non-Functional Requirements](#9-non-functional-requirements)
10. [Security & Privacy Requirements](#10-security--privacy-requirements)
11. [Offline & Low-Connectivity Requirements](#11-offline--low-connectivity-requirements)
12. [Constraints & Assumptions](#12-constraints--assumptions)

---

## 1. Product Overview

### 1.1 Vision Statement

KitchenLens is an AI-powered mobile application that allows users to record a short video or take a photo of their kitchen ingredients and receive intelligent, personalized recipe suggestions. The system leverages a multi-agent Gemini 3 Pro pipeline to analyze recorded videos and captured photos, detect ingredients with high fidelity, and reason about recipes tailored to the user's dietary profile and available inventory.

### 1.2 Core Problem Statement

Home cooks frequently face the challenge of knowing what to cook with what they have. Traditional recipe apps require manual ingredient entry. KitchenLens eliminates this friction by turning a short video scan of fridge/pantry contents into a fully reasoned, step-by-step recipe — automatically.

### 1.3 Target Users

| User Segment | Description |
|---|---|
| Home Cooks | Adults 18–55 who cook regularly and want to reduce food waste |
| Dietary-Restricted Users | Users managing allergies, vegan/keto/halal/gluten-free diets |
| Meal Preppers | Users batch-cooking weekly who need efficiency |
| Mobile-First Users | Users in emerging markets with variable connectivity |

### 1.4 Key Value Propositions

- **Zero manual input** — Scan → Detect → Cook (via **Video** recording or **Photo** capture)
- **Personalized AI reasoning** — Dietary filters applied at the reasoning layer, not post-hoc
- **Offline resilience** — Capture locally, sync and process when connectivity returns
- **Progressive UX** — Recipe results begin streaming as soon as the uploaded media is processed

---

## 2. User Stories & Acceptance Criteria

### Epic 1: Media Capture & Submission (Video or Photo)

**US-001:** As a user, I want to record a short video or take a photo of my pantry/fridge so that the AI can identify what ingredients I have.

- **Acceptance Criteria:**
  - Camera preview launches within 500ms of tapping the scan button
  - **Video mode:** Default recording duration is 15–30 seconds; user can stop early
  - **Photo mode:** User takes one or more photos of their ingredients; photos are uploaded directly
  - Recording/capture is constrained to rear camera, with flash-assist toggle
  - UI displays recording/capture progress and estimated upload state

**US-002:** As a user, I want the recorded video to be automatically optimized before upload so that it processes faster on slow connections.

- **Acceptance Criteria:**
  - Video is downscaled to 720p (1280×720) and re-encoded at 15 FPS locally
  - Vision filters (adaptive contrast enhancement, unsharp mask) are applied to frames
  - Compression results in ≤ 60% original file size without perceptible quality loss
  - Processing occurs on a background isolate and does not block the UI thread
  - For **Photo mode**, photos are uploaded directly without FFmpeg compression; a simplified processing path is used

**US-003:** As a user, I want chunked progressive upload so that AI processing can begin as soon as my media is uploaded.

- **Acceptance Criteria:**
  - Recorded video chunks of 2MB are uploaded progressively after recording completes
  - Appwrite Storage multipart upload endpoints are used for chunked delivery
  - If upload is interrupted, the system resumes from the last completed chunk (resumable upload)
  - A visual progress indicator shows "Analyzing…" as chunks are received by backend

### Epic 2: Ingredient Detection (Vision Agent)

**US-004:** As a user, I want the AI to identify all visible ingredients in my recorded video or captured photo.

- **Acceptance Criteria:**
  - For **Video mode**: The Vision Agent extracts keyframes at 1 FPS (high-resolution) from the uploaded video
  - For **Photo mode**: The Vision Agent processes the uploaded photo(s) directly as keyframes; the Planner Agent step may be simplified or skipped
  - Detected ingredient list is displayed to the user within 10 seconds of full upload
  - Each ingredient is shown with a confidence score (≥70% threshold for display)
  - Users can manually add, remove, or confirm detected ingredients

**US-005:** As a user, I want the system to handle poor lighting or cluttered shelves gracefully.

- **Acceptance Criteria:**
  - Planner Agent flags low-quality video segments or photos and triggers re-capture prompt
  - Confidence scores below 40% are suppressed and a "tap to add manually" hint is shown
  - System degrades gracefully to text-based ingredient entry if media quality is insufficient

### Epic 3: Recipe Generation (Chef Agent)

**US-006:** As a user, I want recipe suggestions tailored to my dietary restrictions.

- **Acceptance Criteria:**
  - Users can set dietary filters: Vegan, Vegetarian, Keto, Halal, Gluten-Free, Nut-Free, Dairy-Free
  - Chef Agent incorporates dietary filters into its reasoning prompt — not as a post-processing filter
  - Generated recipes explicitly reference which detected ingredients are used
  - Recipes include: title, description, servings, prep time, cook time, step-by-step instructions

**US-007:** As a user, I want to see streaming recipe results so I don't have to wait for full processing.

- **Acceptance Criteria:**
  - Recipe title and ingredient list stream to UI before instructions are complete
  - Flutter uses a `StreamBuilder` connected to an SSE or Appwrite Realtime channel
  - Full recipe generation completes within 20 seconds of upload completion

### Epic 4: Session History & Inventory Management

**US-008:** As a user, I want to save detected ingredient lists as my pantry inventory.

- **Acceptance Criteria:**
  - Each session creates an `IngredientScan` document in Appwrite Database
  - Users can mark items as "used" or "low stock" from the inventory view
  - Historical scans are listed with date, thumbnail, and recipe count

---

## 3. AI Strategy — Agentic Multi-Pipeline Architecture

### 3.1 Overview

KitchenLens employs a three-agent orchestration pipeline powered by **Gemini 3 Pro**. Agents communicate state via a shared `thoughtSignature` object — a serialized reasoning context that is passed between agents, enabling each agent to build on the reasoning of its predecessor without re-processing raw input.

```
┌──────────────────────────────────────────────────────────────┐
│                    AGENTIC PIPELINE                          │
│                                                              │
│  ┌─────────────┐   thoughtSignature   ┌─────────────────┐  │
│  │  Agent 1    │──────────────────────▶│    Agent 2      │  │
│  │  (Planner)  │                       │    (Vision)     │  │
│  └─────────────┘                       └────────┬────────┘  │
│                                                  │           │
│                                       thoughtSignature       │
│                                                  │           │
│                                        ┌─────────▼────────┐ │
│                                        │    Agent 3       │ │
│                                        │    (Chef)        │ │
│                                        └──────────────────┘ │
└──────────────────────────────────────────────────────────────┘
```

### 3.2 Agent 1 — Planner Agent

**Responsibility:** Analyzes video quality, extracts metadata, and produces a processing plan.

**Trigger:** Invoked immediately when the first chunk of the uploaded video arrives at the Appwrite Function endpoint.

**Inputs:**
- Video file metadata (duration, resolution, bitrate, codec)
- First 3 keyframes extracted from the video chunk
- User profile (timezone, dietary flags, session history count)

**Gemini 3 Pro API Configuration:** High thinking level, temperature 0.2, max 1024 output tokens; system prompt instructs the model to evaluate frame brightness, focus clarity, occlusion, and ingredient visibility.

**Output — `thoughtSignature` v1:** JSON object containing video_quality_score (0.0–1.0), frame_clarity, recommended_sampling_strategy, occlusion_level, lighting_condition, estimated_ingredient_regions (frame + region + confidence), and a processing_plan listing which frames to skip or focus on.

**Error Conditions:**
- If `video_quality_score < 0.4`: Abort pipeline, return `QUALITY_TOO_LOW` error to client
- If `duration > 120s`: Return `DURATION_EXCEEDED` error; enforce client-side recording limit

---

### 3.3 Agent 2 — Vision Agent

**Responsibility:** Performs high-fidelity ingredient detection on the selected keyframes using multimodal vision capabilities of Gemini 3 Pro.

**Trigger:** Invoked after Planner Agent produces its `thoughtSignature`. Receives the `thoughtSignature` v1 + the full set of extracted keyframes (JPEG, high-resolution).

**Inputs:**
- `thoughtSignature` v1 (from Planner)
- Keyframe images per the `processing_plan.focus_frames` list (base64 encoded or Appwrite Storage references)
- User's known allergen/dietary flags

**Gemini 3 Pro API Configuration:** High thinking level, high media resolution, temperature 0.1, max 4096 output tokens; system prompt instructs the model to identify all visible food ingredients with canonical name, estimated quantity, freshness state, and bounding region.

**Output — `thoughtSignature` v2:** JSON object containing detected_ingredients (each with id, canonical_name, common_name, quantity, unit, freshness, confidence, source_frame, bounding_region), total_detected, low_confidence_suppressed, allergen_flags_detected, and processing_notes.

**Keyframe Sampling Logic:**
- Strategy: **1 FPS, high-resolution** — extracts one frame per second from the video
- Implementation: `video_thumbnail` + `ffmpeg_kit_flutter` for frame extraction
- Resolution: Native capture resolution (max 1080p) preserved for keyframes; only the optimized upload copy is at 720p/15fps
- Frame format: JPEG at 95% quality, max 1920×1440px

---

### 3.4 Agent 3 — Chef Agent

**Responsibility:** Generates personalized, step-by-step recipes based on the detected ingredient inventory, the user's dietary profile, and culinary reasoning.

**Trigger:** Invoked after Vision Agent completes. Receives `thoughtSignature` v2 + user dietary profile.

**Inputs:**
- `thoughtSignature` v2 (from Vision Agent)
- User dietary filters (array of strings: `["vegan", "gluten-free"]`)
- User pantry history (optional: previously detected ingredients that may still be available)
- Preferred cuisine types (optional user preference)
- Number of servings requested

**Gemini 3 Pro API Configuration:** High thinking level, temperature 0.7, max 8192 output tokens; system prompt instructs the model to reason through ingredient combinations, strictly enforce dietary constraints, and include culinary reasoning for each recipe.

**Output — Final Recipe Payload:** JSON object containing a recipes array; each recipe includes id, title, description, dietary_tags, prep_time_minutes, cook_time_minutes, servings, difficulty, ingredients_used, ingredients_list, step-by-step instructions, a reasoning field, and an optional nutrition_estimate.

### 3.5 thoughtSignature Chain Integrity

Each agent signs its output with a SHA-256 hash of the previous signature + its own payload, creating a tamper-evident chain of reasoning. This serves two purposes:

1. **Auditability:** The full reasoning chain can be stored per session for debugging and improvement.
2. **Statefulness:** Any agent can be re-invoked with a specific previous signature to replay or branch the reasoning (useful for "adjust recipe" UX flows).

Each hash is computed as SHA-256 of the concatenation of the previous signature hash (or "genesis" for v1) and the JSON-serialized agent payload.

---

## 4. Video Optimization Requirements

### 4.1 Local Pre-Processing Pipeline

All video optimization occurs **on-device** before any data leaves the app. This protects privacy, reduces bandwidth consumption, and accelerates cloud processing time.

- **Step 1 — Resolution Downscaling:** Downscale to 1280×720 (720p); maintain aspect ratio with letterboxing if needed
- **Step 2 — Frame Rate Reduction:** Reduce to 15 FPS (from native 30/60 FPS) using temporal averaging
- **Step 3 — Vision Filters:** Apply CLAHE contrast enhancement and unsharp mask for ingredient edge sharpening
- **Step 4 — H.264 Re-encoding:** Encode with CRF 28 (fast preset), strip audio track; result is ≤60% of original file size

### 4.2 Vision Filters — Technical Specification

Vision Filters are applied to the recorded video during local pre-processing to artificially enhance ingredient visibility for the AI model. They are applied locally using `ffmpeg_kit_flutter`.

| Filter | Algorithm | Parameters | Purpose |
|---|---|---|---|
| Contrast Enhancement | CLAHE (Contrast Limited Adaptive Histogram Equalization) | `clip_limit=3.0`, `tile_grid_size=8x8` | Improves visibility of dark items in shadows (back of fridge) |
| Unsharp Mask | Laplacian-based sharpening | `sigma=1.5`, `amount=1.0`, `threshold=0` | Enhances edges of ingredient labels and textures |
| Saturation Boost | HSL adjustment | `saturation_multiplier=1.2` | Makes food colors more discriminable for the vision model |
| Denoising | Median filter | `kernel_size=3` | Reduces noise from low-light environments |

### 4.3 Progressive Chunked Upload

**Requirement:** AI analysis should begin as soon as possible after the recorded video file is available, reducing perceived wait time.

**Mechanism:**
1. After recording completes, `ffmpeg_kit_flutter` encodes the recorded video; completed 2MB segments are written to a temporary local buffer.
2. A background `Isolate` monitors the buffer and initiates Appwrite multipart upload for each completed chunk of the **recorded video file**.
3. The Appwrite Function (serverless) is triggered on the first chunk arrival and begins Agent 1 (Planner) analysis immediately.
4. Subsequent chunks allow Agent 2 (Vision) to process more frames as they become available.

Chunk size is 2MB; up to 3 chunks upload in parallel; failed chunks retry with exponential backoff (max 5 attempts, 30-second timeout per chunk).

### 4.4 Keyframe Sampling

For the Vision Agent, keyframes are extracted at **1 FPS** at the highest available resolution (bypassing the 720p/15fps optimization encoding). This dual-pass strategy ensures:

- The **optimized video** is compressed for network efficiency
- The **keyframes** retain maximum visual information for AI inference

Keyframes are extracted at 1 FPS from the original (pre-compressed) video; each keyframe is JPEG at 95% quality, max 1920px wide; a 15-second video produces 15 keyframes.

---

## 5. Tech Stack Specification

### 5.1 Frontend — Flutter

| Component | Technology | Version Requirement |
|---|---|---|
| Framework | Flutter | ≥ 3.22.0 |
| Language | Dart | ≥ 3.4.0 |
| State Management | Riverpod | ≥ 2.5.0 |
| Navigation | go_router | ≥ 14.0.0 |
| Local Storage | Hive / Isar | ≥ 4.0.0 |
| HTTP Client | Dio | ≥ 5.4.0 |

### 5.2 Backend — Appwrite

| Service | Usage |
|---|---|
| **Appwrite Auth** | Email/Password + Google OAuth. JWT-based session management. |
| **Appwrite Storage** | Video chunk storage, keyframe image storage, recipe thumbnail storage |
| **Appwrite Database** | `ingredient_scans`, `recipes`, `user_profiles`, `pantry_inventory` collections |
| **Appwrite Functions** | Serverless orchestrator for the AI agent pipeline (Node.js 21 runtime) |
| **Appwrite Realtime** | WebSocket channel for streaming recipe results to the Flutter client |

**Appwrite Self-Hosted vs Cloud:** Production deployment targets Appwrite Cloud (EU region). Development uses Docker-based local Appwrite instance.

### 5.3 AI — Google Generative AI (Gemini 3 Pro)

| Parameter | Value |
|---|---|
| Model | `gemini-3-pro` |
| SDK | `@google/generative-ai` (Node.js, used in Appwrite Functions) |
| `thinking_level` | `"high"` — enables extended CoT reasoning |
| `media_resolution` | `"high"` — maximum image resolution for vision tasks |
| Authentication | Google AI Studio API Key (stored as Appwrite Function environment variable) |
| Rate Limit Handling | Exponential backoff with jitter; max 3 retries |

---

## 6. Flutter Package Manifest

### 6.1 Core Dependencies

| Package | Version | Purpose |
|---|---|---|
| `camera` | ^0.11.0 | Camera preview and raw video/photo capture |
| `video_compress` | ^3.1.3 | On-device video compression (720p, bitrate control) |
| `ffmpeg_kit_flutter` | ^6.0.3 | FFmpeg for vision filters, frame extraction, and encoding |
| `video_thumbnail` | ^0.5.3 | Fast keyframe extraction |
| `image` | ^4.1.7 | Dart-native image manipulation |
| `appwrite` | ^13.0.0 | Official Appwrite Flutter SDK (Auth, Storage, DB, Realtime) |
| `flutter_riverpod` | ^2.5.1 | Reactive state management |
| `riverpod_annotation` | ^2.3.5 | Code generation for providers |
| `go_router` | ^14.2.0 | Declarative routing |
| `hive_flutter` | ^1.1.0 | Lightweight key-value store for offline caching |
| `isar` / `isar_flutter_libs` | ^3.1.7 | High-performance local database for ingredient history |
| `dio` | ^5.4.3 | HTTP client with interceptors |
| `connectivity_plus` | ^6.0.3 | Network connectivity detection for offline mode |
| `flutter_animate` | ^4.5.0 | Smooth animations for streaming recipe reveal |
| `shimmer` | ^3.0.0 | Loading skeleton screens |
| `cached_network_image` | ^3.3.1 | Efficient remote image loading |
| `lottie` | ^3.1.0 | Lottie animations for processing states |
| `freezed_annotation` | ^2.4.1 | Immutable data classes |
| `json_annotation` | ^4.9.0 | JSON serialization |
| `path_provider` | ^2.1.3 | File system paths for temp chunk storage |
| `permission_handler` | ^11.3.1 | Camera/storage permissions |
| `uuid` | ^4.4.0 | UUID generation for session IDs |
| `crypto` | ^3.0.3 | SHA-256 for thoughtSignature hashing |
| `logger` | ^2.3.0 | Structured logging |

**Dev dependencies:** `build_runner`, `freezed`, `json_serializable`, `riverpod_generator`, `isar_generator`, `flutter_lints`, `mocktail`, `integration_test`.

---

## 7. Data Models

### 7.1 Appwrite Database Collections

#### Collection: `user_profiles`

| Field | Type | Required | Description |
|---|---|---|---|
| `$id` | string | yes | Appwrite auto-generated UUID |
| `user_id` | string | yes | Appwrite Auth User ID |
| `display_name` | string | yes | User display name |
| `dietary_filters` | string[] | no | e.g., `["vegan", "gluten-free"]` |
| `preferred_cuisines` | string[] | no | e.g., `["italian", "asian"]` |
| `default_servings` | integer | no | Default: 2 |
| `created_at` | datetime | yes | |
| `updated_at` | datetime | yes | |

#### Collection: `ingredient_scans`

| Field | Type | Required | Description |
|---|---|---|---|
| `$id` | string | yes | Auto-generated |
| `user_id` | string | yes | Owner reference |
| `session_id` | string | yes | UUID generated client-side |
| `video_file_id` | string | yes | Appwrite Storage file reference |
| `status` | enum | yes | `pending`, `processing`, `complete`, `failed` |
| `thought_signature_v1` | json | no | Planner Agent output |
| `thought_signature_v2` | json | no | Vision Agent output |
| `thought_signature_v3` | json | no | Chef Agent output |
| `detected_ingredients` | json | no | Array of ingredient objects |
| `created_at` | datetime | yes | |

#### Collection: `recipes`

| Field | Type | Required | Description |
|---|---|---|---|
| `$id` | string | yes | Auto-generated |
| `scan_id` | string | yes | Reference to `ingredient_scans.$id` |
| `user_id` | string | yes | Owner |
| `title` | string | yes | Recipe title |
| `description` | string | yes | Short description |
| `dietary_tags` | string[] | yes | |
| `prep_time_minutes` | integer | yes | |
| `cook_time_minutes` | integer | yes | |
| `servings` | integer | yes | |
| `difficulty` | enum | yes | `easy`, `medium`, `hard` |
| `ingredients_list` | json | yes | Structured ingredient array |
| `instructions` | json | yes | Step-by-step array |
| `reasoning` | string | yes | Chef Agent's culinary reasoning |
| `nutrition_estimate` | json | no | Estimated macros |
| `is_saved` | boolean | yes | Default: false |
| `created_at` | datetime | yes | |

#### Collection: `pantry_inventory`

| Field | Type | Required | Description |
|---|---|---|---|
| `$id` | string | yes | Auto-generated |
| `user_id` | string | yes | Owner |
| `ingredient_name` | string | yes | Canonical name |
| `quantity` | string | no | Free-form quantity description |
| `freshness` | enum | no | `fresh`, `stale`, `unknown` |
| `last_seen_scan_id` | string | no | Most recent scan that detected this item |
| `status` | enum | yes | `available`, `low`, `used` |
| `updated_at` | datetime | yes | |

---

## 8. API & Integration Requirements

### 8.1 Appwrite Functions — Agent Orchestrator

**Function Name:** `kitchenlens-pipeline`
**Runtime:** Node.js 21
**Trigger:** HTTP POST + Appwrite Storage Event (new file created in `videos` bucket)
**Memory:** 512MB
**Timeout:** 120 seconds

**Endpoints Exposed:**

| Method | Path | Description |
|---|---|---|
| `POST` | `/pipeline/start` | Initiate pipeline for a scan session |
| `GET` | `/pipeline/status/:session_id` | Poll pipeline status |
| `POST` | `/pipeline/adjust-recipe` | Re-run Chef Agent with modified dietary filters |

### 8.2 Appwrite Realtime Channels

| Channel | Event | Payload |
|---|---|---|
| `databases.kitchenlens.collections.ingredient_scans.documents.{scan_id}` | `databases.*.collections.*.documents.*.update` | Updated `thoughtSignature` and `status` |
| `databases.kitchenlens.collections.recipes.documents` | `databases.*.collections.*.documents.*.create` | New recipe document (streamed as Chef Agent generates each recipe) |

### 8.3 External API Requirements

| Service | Auth Method | Rate Limit Handling |
|---|---|---|
| Google Generative AI (Gemini 3 Pro) | API Key (env var) | Exp. backoff, max 3 retries, jitter |
| Appwrite Cloud | API Key + JWT | SDK-managed |

---

## 9. Non-Functional Requirements

### 9.1 Performance

| Metric | Target |
|---|---|
| Camera preview launch time | < 500ms |
| Video local compression time (15s video) | < 8 seconds |
| First keyframe analysis (Planner Agent) | < 3 seconds post first chunk |
| Full ingredient list available | < 10 seconds post upload |
| First recipe streamed to UI | < 15 seconds post upload |
| Full pipeline completion | < 25 seconds |

### 9.2 Reliability

- Pipeline must retry on transient Gemini API errors (5xx, 429) with exponential backoff
- Appwrite Function invocations are idempotent (keyed by `session_id`)
- All agent outputs persisted to Appwrite Database before next agent is invoked

### 9.3 Scalability

- Appwrite Functions scale horizontally; no state stored in function memory
- `thoughtSignature` objects stored in Appwrite DB and fetched by each agent (not passed in memory)

### 9.4 Accessibility

- WCAG 2.1 AA minimum compliance
- All interactive elements have semantic labels for screen readers
- Minimum 44×44pt tap targets
- Dynamic font size support (Flutter `textScaleFactor`)

---

## 10. Security & Privacy Requirements

### 10.1 Data Handling

- Video files are stored in a **private** Appwrite Storage bucket (not publicly accessible)
- Videos are automatically deleted from Appwrite Storage **48 hours** after processing completes
- Keyframe images are deleted immediately after Vision Agent completes
- `thoughtSignature` documents are retained for 30 days for debugging; user can request deletion

### 10.2 Authentication & Authorization

- All Appwrite API calls use **JWT session tokens** (not API keys on the client)
- Appwrite Database collection permissions: Documents are read/write only by the owning `user_id`
- Appwrite Function calls are authenticated via the user's session token, validated server-side

### 10.3 API Key Security

- Gemini API key stored as an **Appwrite Function environment variable**, never in the Flutter app bundle
- No sensitive configuration in `lib/` source files
- `.env` files excluded via `.gitignore`

---

## 11. Offline & Low-Connectivity Requirements

### 11.1 Offline Scan Queue

- If no network is detected at scan time, the optimized video is stored locally (Isar DB entry + file path)
- An "Offline Queue" badge appears on the home screen showing pending scans
- When connectivity is restored, the queue processor automatically initiates upload and pipeline

### 11.2 Cached Recipe Access

- All previously generated recipes are cached in Hive (local key-value store) after first download
- Users can access past recipes without any network connection
- Ingredient scan history is cached locally; Appwrite sync occurs on reconnect

### 11.3 Connectivity Detection

On launch and scan attempt, connectivity is checked; if offline, the scan is queued locally and uploaded automatically when connection is restored.

### 11.4 Progressive Enhancement Strategy

| Connectivity Level | Behavior |
|---|---|
| Full (WiFi / 4G+) | Full pipeline: 720p optimized video + 1FPS keyframes + streamed results |
| Degraded (3G) | Increase compression (CRF 32), reduce keyframes to 0.5FPS, defer nutrition calculation |
| Minimal (2G / Edge) | Capture only; queue for upload. Show "Queued for processing" status. |
| None | Full offline mode; local scan storage only |

---

## 12. Constraints & Assumptions

### 12.1 Constraints

- Gemini 3 Pro multimodal input is limited to the maximum token/image constraints defined in the API at time of integration; keyframe count per request should not exceed 20 images
- `ffmpeg_kit_flutter` adds ~15–20MB to the app bundle size; this is acceptable given its core role
- Appwrite Functions have a 512MB memory limit; `thoughtSignature` objects must be kept under 1MB

### 12.2 Assumptions

- Users grant camera and storage permissions on first launch
- Target devices are mid-range smartphones (2GB RAM minimum, Android 10+ / iOS 14+)
- Gemini 3 Pro API is commercially available with the `thinking_level: high` and `media_resolution: high` parameters at time of production release
- Appwrite self-hosted deployment is available for enterprise clients who require data residency

### 12.3 Out of Scope (v1.0)

- Real-time AR ingredient overlay in the camera preview
- Barcode / QR code scanning for packaged goods
- Social sharing of recipes
- In-app grocery list generation with retailer integration
- Voice-guided cooking mode
