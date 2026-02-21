# KitchenLens — Technical Implementation Guide

**Version:** 1.0.0
**Date:** February 20, 2026
**Author:** KitchenLens Architecture Team
**Companion Document:** `requirements.md`

---

## Table of Contents

1. [Project Folder Structure](#1-project-folder-structure)
2. [Architecture Overview](#2-architecture-overview)
3. [Phase 1 — Camera, Video Optimization & Upload](#3-phase-1--camera-video-optimization--upload)
4. [Phase 2 — Agentic AI Pipeline (Appwrite Functions)](#4-phase-2--agentic-ai-pipeline-appwrite-functions)
5. [Phase 3 — Recipe UI & Streaming Results](#5-phase-3--recipe-ui--streaming-results)
6. [Offline Queue & Connectivity Handling](#6-offline-queue--connectivity-handling)
7. [Appwrite Configuration](#7-appwrite-configuration)
8. [Environment Configuration](#8-environment-configuration)
9. [Testing Strategy](#9-testing-strategy)
10. [Build & Deployment](#10-build--deployment)

---

## 1. Project Folder Structure

KitchenLens follows **Clean Architecture** with a feature-first folder organization. This separation ensures testability, clear dependency rules, and independent feature development.

```
kitchenlens/
├── android/
├── ios/
├── appwrite-functions/                  # Serverless backend (Node.js 21)
│   └── kitchenlens-pipeline/
│       ├── src/
│       │   ├── agents/
│       │   │   ├── plannerAgent.js      # Agent 1: Video quality analysis
│       │   │   ├── visionAgent.js       # Agent 2: Ingredient detection
│       │   │   └── chefAgent.js         # Agent 3: Recipe reasoning
│       │   ├── services/
│       │   │   ├── geminiService.js     # Gemini 3 Pro API wrapper
│       │   │   ├── appwriteService.js   # Internal Appwrite DB/Storage access
│       │   │   └── frameExtractor.js   # Keyframe sampling utility
│       │   ├── models/
│       │   │   └── thoughtSignature.js  # ThoughtSignature schema + hash utility
│       │   └── index.js                 # Function entry point
│       ├── package.json
│       └── .env.example
│
├── lib/
│   ├── main.dart                         # App entry point, ProviderScope, GoRouter
│   ├── app.dart                          # MaterialApp + theme + router config
│   │
│   ├── core/                             # Shared infrastructure (no feature logic)
│   │   ├── constants/
│   │   │   ├── app_constants.dart        # API endpoints, app-level constants
│   │   │   └── appwrite_constants.dart   # Collection IDs, bucket IDs
│   │   ├── errors/
│   │   │   ├── app_exception.dart        # Custom exception hierarchy
│   │   │   └── failure.dart              # Freezed failure sealed class
│   │   ├── network/
│   │   │   ├── connectivity_service.dart # connectivity_plus wrapper
│   │   │   └── dio_client.dart           # Configured Dio instance
│   │   ├── storage/
│   │   │   ├── hive_service.dart         # Hive initialization + box access
│   │   │   └── isar_service.dart         # Isar DB initialization
│   │   ├── theme/
│   │   │   ├── app_theme.dart            # Material 3 theme config
│   │   │   └── app_colors.dart
│   │   └── utils/
│   │       ├── logger.dart               # Structured logger (logger package)
│   │       ├── sha256_util.dart          # thoughtSignature hashing
│   │       └── file_utils.dart           # Temp file path management
│   │
│   ├── features/
│   │   │
│   │   ├── auth/
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   └── auth_remote_datasource.dart
│   │   │   │   ├── models/
│   │   │   │   │   └── user_model.dart
│   │   │   │   └── repositories/
│   │   │   │       └── auth_repository_impl.dart
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   └── user_entity.dart
│   │   │   │   ├── repositories/
│   │   │   │   │   └── auth_repository.dart
│   │   │   │   └── usecases/
│   │   │   │       ├── sign_in_usecase.dart
│   │   │   │       └── sign_out_usecase.dart
│   │   │   └── presentation/
│   │   │       ├── providers/
│   │   │       │   └── auth_provider.dart
│   │   │       ├── pages/
│   │   │       │   ├── login_page.dart
│   │   │       │   └── register_page.dart
│   │   │       └── widgets/
│   │   │           └── auth_form_widget.dart
│   │   │
│   │   ├── scan/                         # Camera capture + video optimization
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── camera_datasource.dart
│   │   │   │   │   ├── video_processor_datasource.dart
│   │   │   │   │   └── upload_datasource.dart
│   │   │   │   ├── models/
│   │   │   │   │   ├── scan_session_model.dart
│   │   │   │   │   └── upload_chunk_model.dart
│   │   │   │   └── repositories/
│   │   │   │       └── scan_repository_impl.dart
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   └── scan_session_entity.dart
│   │   │   │   ├── repositories/
│   │   │   │   │   └── scan_repository.dart
│   │   │   │   └── usecases/
│   │   │   │       ├── start_scan_usecase.dart
│   │   │   │       ├── process_video_usecase.dart
│   │   │   │       └── upload_video_usecase.dart
│   │   │   └── presentation/
│   │   │       ├── providers/
│   │   │       │   ├── camera_provider.dart
│   │   │       │   ├── video_processor_provider.dart
│   │   │       │   └── upload_provider.dart
│   │   │       ├── pages/
│   │   │       │   └── scan_page.dart
│   │   │       └── widgets/
│   │   │           ├── camera_preview_widget.dart
│   │   │           ├── recording_controls_widget.dart
│   │   │           ├── upload_progress_widget.dart
│   │   │           └── vision_filter_overlay.dart  # Recording-time UI overlay only (not live AI inference)
│   │   │
│   │   ├── ingredients/                  # Ingredient detection results
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   └── ingredients_remote_datasource.dart
│   │   │   │   ├── models/
│   │   │   │   │   └── ingredient_model.dart
│   │   │   │   └── repositories/
│   │   │   │       └── ingredients_repository_impl.dart
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   └── ingredient_entity.dart
│   │   │   │   ├── repositories/
│   │   │   │   │   └── ingredients_repository.dart
│   │   │   │   └── usecases/
│   │   │   │       ├── get_scan_ingredients_usecase.dart
│   │   │   │       └── confirm_ingredient_usecase.dart
│   │   │   └── presentation/
│   │   │       ├── providers/
│   │   │       │   └── ingredients_provider.dart
│   │   │       ├── pages/
│   │   │       │   └── ingredients_review_page.dart
│   │   │       └── widgets/
│   │   │           ├── ingredient_chip_widget.dart
│   │   │           └── confidence_badge_widget.dart
│   │   │
│   │   ├── recipes/                      # Recipe generation + display
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── recipes_remote_datasource.dart
│   │   │   │   │   └── recipes_local_datasource.dart  # Hive cache
│   │   │   │   ├── models/
│   │   │   │   │   └── recipe_model.dart
│   │   │   │   └── repositories/
│   │   │   │       └── recipes_repository_impl.dart
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   └── recipe_entity.dart
│   │   │   │   ├── repositories/
│   │   │   │   │   └── recipes_repository.dart
│   │   │   │   └── usecases/
│   │   │   │       ├── stream_recipes_usecase.dart
│   │   │   │       └── save_recipe_usecase.dart
│   │   │   └── presentation/
│   │   │       ├── providers/
│   │   │       │   ├── recipe_stream_provider.dart
│   │   │       │   └── saved_recipes_provider.dart
│   │   │       ├── pages/
│   │   │       │   ├── recipes_list_page.dart
│   │   │       │   └── recipe_detail_page.dart
│   │   │       └── widgets/
│   │   │           ├── recipe_card_widget.dart
│   │   │           ├── streaming_recipe_widget.dart
│   │   │           ├── nutrition_badge_widget.dart
│   │   │           └── step_by_step_widget.dart
│   │   │
│   │   ├── pantry/                       # Pantry inventory management
│   │   │   └── ...                       # Mirrors above structure
│   │   │
│   │   └── settings/                     # User profile + dietary preferences
│   │       └── ...
│   │
│   └── shared/                           # Cross-feature shared widgets
│       ├── widgets/
│       │   ├── app_scaffold.dart
│       │   ├── loading_overlay.dart
│       │   ├── error_snackbar.dart
│       │   └── offline_banner.dart
│       └── extensions/
│           ├── context_extensions.dart
│           └── string_extensions.dart
│
├── test/
│   ├── unit/
│   │   ├── core/
│   │   └── features/
│   ├── widget/
│   └── integration/
│
├── pubspec.yaml
├── analysis_options.yaml
├── requirements.md
└── implementation.md
```

---

## 2. Architecture Overview

### 2.1 Clean Architecture Dependency Rule


**Dependency Rules:**
- `presentation` → `domain` only (never `data` directly)
- `data` → `domain` (implements interfaces defined in domain)
- `domain` → nothing (pure Dart)
- `core` → nothing (infrastructure only)

### 2.2 State Management — Riverpod

All application state is managed via **Riverpod 2 with code generation** (`riverpod_annotation`). This provides:
- Compile-time safety
- Automatic dependency tracking
- Easy testability (provider overrides in tests)

**Provider Hierarchy (Scan Feature Example):** `appwriteClientProvider` (core) → `scanRepositoryProvider` (data) → `cameraProvider`, `videoProcessorProvider`, `uploadProvider` (presentation) → `scanSessionProvider` (session state).

---

## 3. Phase 1 — Camera, Video Optimization & Upload

### 3.1 Camera Setup

**File:** `lib/features/scan/data/datasources/camera_datasource.dart`

> **Note:** `CameraDataSource` is used for **recording a video** (15–30s) or **taking a photo** that is then submitted to the backend. It does not stream live camera frames to the backend or perform live AI inference.


### 3.2 Video Processing Pipeline

**File:** `lib/features/scan/data/datasources/video_processor_datasource.dart`

Applies the full FFmpeg filter chain (scale, FPS reduction, unsharp mask, saturation boost, denoising, H.264 re-encoding) in a background isolate, and extracts 1-FPS keyframes from the original video at full resolution.

### 3.3 Progressive Chunked Upload

**File:** `lib/features/scan/data/datasources/upload_datasource.dart`

> **Note:** This uploader handles uploading a **recorded video file** (or captured photo) to Appwrite Storage in chunks. It does not stream a live camera feed — recording must be complete before upload begins.


### 3.4 Upload Provider (Riverpod)

**File:** `lib/features/scan/presentation/providers/upload_provider.dart`

Manages upload state (idle → processing → uploading → triggeringPipeline → complete/error), orchestrating video processing, keyframe extraction, chunked upload, and pipeline trigger in sequence.

---

## 4. Phase 2 — Agentic AI Pipeline (Appwrite Functions)

### 4.1 Function Entry Point

**File:** `appwrite-functions/kitchenlens-pipeline/src/index.js`

Serverless entry point that parses the incoming request, sequentially invokes Planner → Vision → Chef agents, persists each `thoughtSignature` to Appwrite Database, and returns pipeline status; aborts early on quality failure.

### 4.2 Gemini Service Wrapper

**File:** `appwrite-functions/kitchenlens-pipeline/src/services/geminiService.js`

Wraps the `@google/generative-ai` SDK; configures thinking budget, temperature, and safety settings per agent; provides `generateWithRetry` with exponential backoff on 429/5xx errors, and a helper to convert file buffers to base64 inline parts.

### 4.3 Agent 1 — Planner Agent Implementation

**File:** `appwrite-functions/kitchenlens-pipeline/src/agents/plannerAgent.js`

Downloads the first 3 keyframes from Appwrite Storage, sends them to Gemini with a quality-analysis prompt, and returns a `thoughtSignature` v1 containing the video quality score and processing plan.

### 4.4 Agent 2 — Vision Agent Implementation

**File:** `appwrite-functions/kitchenlens-pipeline/src/agents/visionAgent.js`

Loads the focus-frame keyframes identified by the Planner, sends them to Gemini with a culinary-vision prompt (incorporating occlusion notes and dietary flags), and returns a `thoughtSignature` v2 with the detected ingredient list.

### 4.5 Agent 3 — Chef Agent Implementation

**File:** `appwrite-functions/kitchenlens-pipeline/src/agents/chefAgent.js`

Fetches the user's pantry history for supplementary context, sends the ingredient list and dietary constraints to Gemini with a chef-reasoning prompt, and returns a `thoughtSignature` v3 with 3 diverse recipe suggestions.

### 4.6 ThoughtSignature Model

**File:** `appwrite-functions/kitchenlens-pipeline/src/models/thoughtSignature.js`

Provides a `ThoughtSignature.create()` factory that merges agent metadata with the payload and appends a SHA-256 hash chain field; also provides `verifyChain()` to validate the full signature chain integrity.

---

## 5. Phase 3 — Recipe UI & Streaming Results

### 5.1 Appwrite Realtime Provider

**File:** `lib/features/recipes/presentation/providers/recipe_stream_provider.dart`

Subscribes to Appwrite Realtime for recipe document creation events filtered by session ID; accumulates incoming recipes and emits the updated list as a stream consumed by the UI.

### 5.2 Streaming Recipe Widget

**File:** `lib/features/recipes/presentation/widgets/streaming_recipe_widget.dart`

Renders a pipeline status bar and a live-updating list of recipe cards (with slide-in animations); shows shimmer skeletons while the pipeline is still running and an error state on failure.

### 5.3 Recipe Detail Page

**File:** `lib/features/recipes/presentation/pages/recipe_detail_page.dart`

Displays a full recipe with a hero app bar, dietary tags, time/servings metadata, chef reasoning, nutrition estimate, ingredient list, and step-by-step instructions; includes a save/bookmark FAB.

---

## 6. Offline Queue & Connectivity Handling

### 6.1 Offline Queue Service

**File:** `lib/core/network/offline_queue_service.dart`

Persists pending scans to Isar DB, listens for connectivity changes, and automatically processes the queue (retrying uploads) when connectivity is restored.

### 6.2 Offline Banner Widget

**File:** `lib/shared/widgets/offline_banner.dart`

Animates a banner into view when connectivity is lost, showing the number of queued scans; slides out when the connection is restored.

---

## 7. Appwrite Configuration

### 7.1 Appwrite Constants

**File:** `lib/core/constants/appwrite_constants.dart`

Declares all Appwrite resource identifiers (project ID, endpoint, database ID, collection IDs, bucket IDs, function ID) as compile-time constants sourced from `--dart-define` environment variables.

### 7.2 Appwrite Client Provider

**File:** `lib/core/storage/appwrite_client_provider.dart`

Provides a configured `Client` instance and Riverpod providers for `Account`, `Databases`, `Storage`, `Realtime`, and `Functions` — all derived from a single client configured with the project ID and endpoint.

---

## 8. Environment Configuration

### 8.1 Flutter Environment Variables (dart-define)

KitchenLens uses `--dart-define` for environment isolation. No secrets should be in the app bundle. Pass `APPWRITE_PROJECT_ID` and `APPWRITE_ENDPOINT` via `--dart-define` flags when running (`flutter run`) or building (`flutter build apk --release`).

### 8.2 Appwrite Function Environment Variables

**File:** `appwrite-functions/kitchenlens-pipeline/.env.example`

Required variables: `APPWRITE_FUNCTION_API_ENDPOINT`, `APPWRITE_FUNCTION_PROJECT_ID`, `APPWRITE_API_KEY`, `GEMINI_API_KEY`, `DATABASE_ID`, `VIDEOS_BUCKET_ID`, `KEYFRAMES_BUCKET_ID`, `SCANS_COLLECTION_ID`, `RECIPES_COLLECTION_ID`, `PANTRY_COLLECTION_ID`.

**Security note:** These variables are set in the Appwrite Console under the Function's settings (Settings → Environment Variables). They are **never** committed to version control.

---

## 9. Testing Strategy

### 9.1 Unit Tests

**Coverage Target:** ≥80% on Domain + Data layers. Tests use `mocktail` for mocking and cover video processor success/failure paths, upload retry logic, and agent output validation.

### 9.2 Integration Tests

**File:** `test/integration/scan_to_recipe_flow_test.dart`

Tests the full flow from scan launch through upload, pipeline trigger, and recipe card rendering, using a test Appwrite project and mocked Gemini responses.

### 9.3 Appwrite Function Tests (Node.js)

Jest/Vitest unit tests for each agent (`plannerAgent.test.js`, `visionAgent.test.js`, `chefAgent.test.js`) mock the Gemini service and Appwrite Storage to validate quality-check thresholds, ingredient parsing, and dietary constraint enforcement.

---

## 10. Build & Deployment

### 10.1 Local Development Setup

Install Flutter 3.22+, run `flutter pub get`, then `dart run build_runner build --delete-conflicting-outputs` for code generation. Start a local Appwrite instance via Docker, then run the app with `flutter run` passing `--dart-define` for `APPWRITE_PROJECT_ID` and `APPWRITE_ENDPOINT`. Deploy the function locally using the Appwrite CLI.

### 10.2 CI/CD Pipeline (GitHub Actions)

The pipeline runs on push/PR to `main`/`develop`: runs `flutter analyze` and `flutter test --coverage`, then builds Android APK and iOS IPA in parallel. On merge to `main`, the Appwrite Function is deployed automatically using the Appwrite CLI action with secrets from GitHub repository settings.


### 10.3 Production Release Checklist

- [ ] Gemini API key rotated and stored in Appwrite Function env vars
- [ ] Appwrite Storage bucket permissions verified (private, user-scoped)
- [ ] Video auto-deletion lifecycle rule configured (48h TTL)
- [ ] Keyframe bucket auto-deletion configured (24h TTL)
- [ ] Flutter `--release` build tested on physical Android + iOS devices
- [ ] Offline queue behavior tested with airplane mode
- [ ] Rate limit handling verified with Gemini API (mock 429 responses)
- [ ] `thoughtSignature` chain integrity verification enabled in production
- [ ] Crashlytics / Sentry error monitoring integrated
- [ ] App Store / Google Play store metadata prepared
