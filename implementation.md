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
│   │   │           └── vision_filter_overlay.dart
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

```
  ┌────────────────────────────────────┐
  │         Presentation Layer          │  Riverpod Providers, Pages, Widgets
  │         (depends on Domain)         │
  ├────────────────────────────────────┤
  │           Domain Layer              │  Entities, Repository Interfaces, Use Cases
  │      (pure Dart, no Flutter)        │  NO external package dependencies
  ├────────────────────────────────────┤
  │            Data Layer               │  Repository Impls, Remote/Local DataSources
  │    (implements Domain interfaces)   │  Models (JSON serializable), Appwrite SDK
  └────────────────────────────────────┘
               ▲ depends on
  ┌────────────────────────────────────┐
  │              Core                  │  DI, Constants, Shared Services, Theme
  └────────────────────────────────────┘
```

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

**Provider Hierarchy (Scan Feature Example):**
```
appwriteClientProvider (core)
    └── scanRepositoryProvider (data)
            ├── cameraProvider (presentation)
            ├── videoProcessorProvider (presentation)
            └── uploadProvider (presentation)
                    └── scanSessionProvider (tracks session state)
```

---

## 3. Phase 1 — Camera, Video Optimization & Upload

### 3.1 Camera Setup

**File:** `lib/features/scan/data/datasources/camera_datasource.dart`

```dart
import 'package:camera/camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'camera_datasource.g.dart';

@riverpod
class CameraDataSource extends _$CameraDataSource {
  CameraController? _controller;

  @override
  Future<CameraController> build() async {
    final cameras = await availableCameras();
    // Select rear camera; fallback to first available
    final rearCamera = cameras.firstWhere(
      (c) => c.lensDirection == CameraLensDirection.back,
      orElse: () => cameras.first,
    );

    _controller = CameraController(
      rearCamera,
      ResolutionPreset.high, // 1080p capture for maximum keyframe quality
      enableAudio: false,    // Audio not needed; reduces file size
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await _controller!.initialize();

    // Lock exposure and focus for consistent frames
    await _controller!.setExposureMode(ExposureMode.auto);
    await _controller!.setFocusMode(FocusMode.auto);

    ref.onDispose(() => _controller?.dispose());
    return _controller!;
  }

  Future<void> startRecording(String outputPath) async {
    final controller = await future;
    if (controller.value.isRecordingVideo) return;
    await controller.startVideoRecording();
  }

  Future<XFile> stopRecording() async {
    final controller = await future;
    return await controller.stopVideoRecording();
  }
}
```

### 3.2 Video Processing Pipeline

**File:** `lib/features/scan/data/datasources/video_processor_datasource.dart`

```dart
import 'dart:io';
import 'dart:isolate';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:kitchenlens/core/utils/logger.dart';

class VideoProcessorDataSource {
  final AppLogger _logger;

  VideoProcessorDataSource(this._logger);

  /// Step 1: Apply vision filters and compress video to 720p/15fps
  /// Returns path to the optimized video file
  Future<String> processVideoForUpload(String inputPath) async {
    final tempDir = await getTemporaryDirectory();
    final outputPath = '${tempDir.path}/processed_${DateTime.now().millisecondsSinceEpoch}.mp4';

    // Run in a background isolate to avoid blocking the UI thread
    final result = await Isolate.run(() => _runFFmpegProcessing(inputPath, outputPath));

    if (!result) {
      throw VideoProcessingException('FFmpeg processing failed for: $inputPath');
    }

    _logger.info('Video processed successfully: $outputPath');
    return outputPath;
  }

  static Future<bool> _runFFmpegProcessing(String input, String output) async {
    // Full FFmpeg filter chain:
    // 1. scale=1280:720         → Downscale to 720p
    // 2. fps=15                 → Reduce to 15 FPS
    // 3. unsharp=5:5:1.0:5:5:0.0 → Unsharp mask (sharpness boost for ingredient edges)
    // 4. eq=saturation=1.2      → Saturation boost (food color enhancement)
    // 5. hqdn3d=3:3:6:6         → Temporal denoising
    // -c:v libx264 -crf 28      → H.264 encoding, quality factor 28 (~60% size reduction)
    // -preset fast              → Encoder speed vs compression tradeoff
    // -an                       → Strip audio track

    final session = await FFmpegKit.execute(
      '-i "$input" '
      '-vf "scale=1280:720,fps=15,unsharp=5:5:1.0:5:5:0.0,eq=saturation=1.2,hqdn3d=3:3:6:6" '
      '-c:v libx264 -crf 28 -preset fast '
      '-an '
      '"$output"',
    );

    final returnCode = await session.getReturnCode();
    return ReturnCode.isSuccess(returnCode);
  }

  /// Step 2: Extract keyframes at 1 FPS (high-resolution, from ORIGINAL video)
  /// Returns a list of local file paths for the extracted JPEG keyframes
  Future<List<String>> extractKeyframes(String originalVideoPath) async {
    final tempDir = await getTemporaryDirectory();
    final keyframesDir = Directory('${tempDir.path}/keyframes_${DateTime.now().millisecondsSinceEpoch}');
    await keyframesDir.create(recursive: true);

    // Get video duration
    final duration = await _getVideoDuration(originalVideoPath);
    final frameCount = duration.inSeconds; // 1 frame per second

    final List<String> framePaths = [];

    for (int second = 0; second < frameCount; second++) {
      final framePath = '${keyframesDir.path}/frame_$second.jpg';

      // Extract frame at specific timestamp using ffmpeg_kit
      final session = await FFmpegKit.execute(
        '-i "$originalVideoPath" '
        '-ss ${second} '         // Seek to timestamp
        '-vframes 1 '            // Extract exactly 1 frame
        '-q:v 2 '                // JPEG quality (scale 1-31, lower = better). ~95% quality
        '-s 1920x1440 '          // Max resolution for keyframes
        '"$framePath"',
      );

      final returnCode = await session.getReturnCode();
      if (ReturnCode.isSuccess(returnCode)) {
        framePaths.add(framePath);
      }
    }

    _logger.info('Extracted ${framePaths.length} keyframes from $originalVideoPath');
    return framePaths;
  }

  Future<Duration> _getVideoDuration(String videoPath) async {
    // Use FFprobe via ffmpeg_kit to get duration
    final mediaInfo = await FFmpegKit.execute('-i "$videoPath" 2>&1 | grep Duration');
    // Parse duration from output (fallback: 30 seconds)
    return Duration(seconds: 30);
  }
}
```

### 3.3 Progressive Chunked Upload

**File:** `lib/features/scan/data/datasources/upload_datasource.dart`

```dart
import 'dart:io';
import 'dart:async';
import 'package:appwrite/appwrite.dart';
import 'package:kitchenlens/core/constants/appwrite_constants.dart';

class UploadDataSource {
  final Storage _storage;
  final Functions _functions;

  static const int _chunkSizeBytes = 2 * 1024 * 1024; // 2MB chunks
  static const int _maxRetryAttempts = 5;

  UploadDataSource(Client client)
      : _storage = Storage(client),
        _functions = Functions(client);

  /// Uploads a video file using Appwrite's chunked multipart upload.
  /// Yields progress (0.0 to 1.0) as each chunk completes.
  Stream<double> uploadVideoChunked({
    required String sessionId,
    required String localFilePath,
    required void Function(String fileId) onFileIdAvailable,
  }) async* {
    final file = File(localFilePath);
    final fileSize = await file.length();
    final totalChunks = (fileSize / _chunkSizeBytes).ceil();
    int uploadedChunks = 0;

    // Appwrite SDK handles chunked upload natively via InputFile.fromPath
    // For files > 5MB, Appwrite automatically uses multipart upload
    final inputFile = InputFile.fromPath(
      path: localFilePath,
      filename: 'scan_$sessionId.mp4',
      contentType: 'video/mp4',
    );

    // Start upload — Appwrite returns the file document once upload begins
    final uploadedFile = await _retryWithBackoff(() => _storage.createFile(
      bucketId: AppwriteConstants.videosBucketId,
      fileId: sessionId, // Use session ID as file ID for idempotency
      file: inputFile,
      onProgress: (progress) {
        // This callback is invoked by Appwrite SDK per-chunk
        uploadedChunks = (progress.chunksUploaded);
        // We yield progress inside the stream using a controller
      },
      permissions: [
        Permission.read(Role.user(sessionId)),
        Permission.write(Role.user(sessionId)),
      ],
    ));

    onFileIdAvailable(uploadedFile.$id);
    yield 1.0; // Upload complete
  }

  Future<T> _retryWithBackoff<T>(Future<T> Function() operation) async {
    int attempt = 0;
    while (true) {
      try {
        return await operation();
      } catch (e) {
        attempt++;
        if (attempt >= _maxRetryAttempts) rethrow;
        // Exponential backoff with jitter
        final delay = Duration(milliseconds: (1000 * (1 << attempt)) + _jitter());
        await Future.delayed(delay);
      }
    }
  }

  int _jitter() => DateTime.now().millisecondsSinceEpoch % 500;

  /// Uploads keyframe images to Appwrite Storage for Vision Agent consumption
  Future<List<String>> uploadKeyframes({
    required String sessionId,
    required List<String> keyframePaths,
  }) async {
    final fileIds = <String>[];

    for (int i = 0; i < keyframePaths.length; i++) {
      final fileId = await _retryWithBackoff(() async {
        final file = await _storage.createFile(
          bucketId: AppwriteConstants.keyframesBucketId,
          fileId: '${sessionId}_frame_$i',
          file: InputFile.fromPath(
            path: keyframePaths[i],
            filename: 'keyframe_${sessionId}_$i.jpg',
            contentType: 'image/jpeg',
          ),
        );
        return file.$id;
      });
      fileIds.add(fileId);
    }

    return fileIds;
  }

  /// Triggers the Appwrite Function to initiate the AI pipeline
  Future<void> triggerPipeline({
    required String sessionId,
    required String videoFileId,
    required List<String> keyframeFileIds,
    required List<String> dietaryFilters,
  }) async {
    await _functions.createExecution(
      functionId: AppwriteConstants.pipelineFunctionId,
      body: {
        'session_id': sessionId,
        'video_file_id': videoFileId,
        'keyframe_file_ids': keyframeFileIds,
        'dietary_filters': dietaryFilters,
      }.toString(),
      async: true, // Non-blocking: result comes via Realtime
    );
  }
}
```

### 3.4 Upload Provider (Riverpod)

**File:** `lib/features/scan/presentation/providers/upload_provider.dart`

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_provider.g.dart';
part 'upload_provider.freezed.dart';

@freezed
class UploadState with _$UploadState {
  const factory UploadState.idle() = _Idle;
  const factory UploadState.processing({required double progress}) = _Processing;
  const factory UploadState.uploading({required double progress}) = _Uploading;
  const factory UploadState.triggeringPipeline() = _TriggeringPipeline;
  const factory UploadState.complete({required String sessionId}) = _Complete;
  const factory UploadState.error({required String message}) = _Error;
}

@riverpod
class UploadNotifier extends _$UploadNotifier {
  @override
  UploadState build() => const UploadState.idle();

  Future<void> processAndUpload({
    required String rawVideoPath,
    required String sessionId,
    required List<String> dietaryFilters,
  }) async {
    final processor = ref.read(videoProcessorDataSourceProvider);
    final uploader = ref.read(uploadDataSourceProvider);

    try {
      // Phase 1: Local video optimization
      state = const UploadState.processing(progress: 0.0);
      final processedPath = await processor.processVideoForUpload(rawVideoPath);
      state = const UploadState.processing(progress: 0.5);

      // Phase 2: Extract keyframes from ORIGINAL (high-res) video
      final keyframePaths = await processor.extractKeyframes(rawVideoPath);
      state = const UploadState.processing(progress: 1.0);

      // Phase 3: Upload processed video (chunked)
      String? videoFileId;
      await for (final progress in uploader.uploadVideoChunked(
        sessionId: sessionId,
        localFilePath: processedPath,
        onFileIdAvailable: (id) => videoFileId = id,
      )) {
        state = UploadState.uploading(progress: progress);
      }

      // Phase 4: Upload keyframes
      final keyframeFileIds = await uploader.uploadKeyframes(
        sessionId: sessionId,
        keyframePaths: keyframePaths,
      );

      // Phase 5: Trigger AI pipeline
      state = const UploadState.triggeringPipeline();
      await uploader.triggerPipeline(
        sessionId: sessionId,
        videoFileId: videoFileId!,
        keyframeFileIds: keyframeFileIds,
        dietaryFilters: dietaryFilters,
      );

      state = UploadState.complete(sessionId: sessionId);

      // Cleanup temp files
      await _cleanupTempFiles([processedPath, ...keyframePaths]);
    } catch (e) {
      state = UploadState.error(message: e.toString());
    }
  }

  Future<void> _cleanupTempFiles(List<String> paths) async {
    for (final path in paths) {
      final file = File(path);
      if (await file.exists()) await file.delete();
    }
  }
}
```

---

## 4. Phase 2 — Agentic AI Pipeline (Appwrite Functions)

### 4.1 Function Entry Point

**File:** `appwrite-functions/kitchenlens-pipeline/src/index.js`

```javascript
import { Client, Databases, Storage } from 'node-appwrite';
import { PlannerAgent } from './agents/plannerAgent.js';
import { VisionAgent } from './agents/visionAgent.js';
import { ChefAgent } from './agents/chefAgent.js';
import { AppwriteService } from './services/appwriteService.js';

export default async ({ req, res, log, error }) => {
  const client = new Client()
    .setEndpoint(process.env.APPWRITE_FUNCTION_API_ENDPOINT)
    .setProject(process.env.APPWRITE_FUNCTION_PROJECT_ID)
    .setKey(process.env.APPWRITE_API_KEY);

  const appwriteService = new AppwriteService(client);

  let body;
  try {
    body = typeof req.body === 'string' ? JSON.parse(req.body) : req.body;
  } catch {
    return res.json({ error: 'Invalid request body' }, 400);
  }

  const { session_id, video_file_id, keyframe_file_ids, dietary_filters } = body;

  if (!session_id || !video_file_id) {
    return res.json({ error: 'Missing required fields: session_id, video_file_id' }, 400);
  }

  log(`[Pipeline] Starting for session: ${session_id}`);

  try {
    // Update scan status to 'processing'
    await appwriteService.updateScanStatus(session_id, 'processing');

    // ─── AGENT 1: PLANNER ────────────────────────────────────────────────
    log('[Agent 1] Planner started');
    const planner = new PlannerAgent(client);
    const thoughtSignatureV1 = await planner.execute({
      session_id,
      video_file_id,
      keyframe_file_ids: keyframe_file_ids.slice(0, 3), // First 3 frames for quality check
    });

    if (thoughtSignatureV1.video_quality_score < 0.4) {
      await appwriteService.updateScanStatus(session_id, 'failed', {
        error_code: 'QUALITY_TOO_LOW',
        error_message: 'Video quality insufficient for ingredient detection.',
      });
      return res.json({ status: 'failed', reason: 'QUALITY_TOO_LOW' });
    }

    // Persist thoughtSignatureV1
    await appwriteService.updateThoughtSignature(session_id, 'v1', thoughtSignatureV1);
    log(`[Agent 1] Complete. Quality score: ${thoughtSignatureV1.video_quality_score}`);

    // ─── AGENT 2: VISION ─────────────────────────────────────────────────
    log('[Agent 2] Vision started');
    const vision = new VisionAgent(client);
    const thoughtSignatureV2 = await vision.execute({
      thought_signature_v1: thoughtSignatureV1,
      keyframe_file_ids,
      dietary_filters,
    });

    await appwriteService.updateThoughtSignature(session_id, 'v2', thoughtSignatureV2);
    await appwriteService.updateDetectedIngredients(
      session_id,
      thoughtSignatureV2.detected_ingredients
    );
    log(`[Agent 2] Complete. Detected: ${thoughtSignatureV2.total_detected} ingredients`);

    // ─── AGENT 3: CHEF ───────────────────────────────────────────────────
    log('[Agent 3] Chef started');
    const chef = new ChefAgent(client);
    const thoughtSignatureV3 = await chef.execute({
      thought_signature_v2: thoughtSignatureV2,
      dietary_filters,
      user_id: body.user_id,
    });

    // Persist each recipe as an individual Appwrite document
    // (Appwrite Realtime notifies Flutter client as each document is created)
    for (const recipe of thoughtSignatureV3.recipes) {
      await appwriteService.createRecipeDocument(session_id, body.user_id, recipe);
      log(`[Agent 3] Recipe created: ${recipe.title}`);
    }

    await appwriteService.updateThoughtSignature(session_id, 'v3', thoughtSignatureV3);
    await appwriteService.updateScanStatus(session_id, 'complete');

    log(`[Pipeline] Completed for session: ${session_id}`);
    return res.json({ status: 'complete', session_id });

  } catch (err) {
    error(`[Pipeline] Fatal error for session ${session_id}: ${err.message}`);
    await appwriteService.updateScanStatus(session_id, 'failed', {
      error_code: 'PIPELINE_ERROR',
      error_message: err.message,
    });
    return res.json({ error: 'Pipeline execution failed', details: err.message }, 500);
  }
};
```

### 4.2 Gemini Service Wrapper

**File:** `appwrite-functions/kitchenlens-pipeline/src/services/geminiService.js`

```javascript
import { GoogleGenerativeAI, HarmCategory, HarmBlockThreshold } from '@google/generative-ai';

export class GeminiService {
  constructor() {
    this.genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY);
  }

  /**
   * Returns a configured Gemini 3 Pro model instance.
   * @param {object} options - Override generation config
   */
  getModel(options = {}) {
    return this.genAI.getGenerativeModel({
      model: 'gemini-3-pro',
      generationConfig: {
        thinkingConfig: {
          thinkingBudget: options.thinking_level === 'high' ? 8192 : 2048,
        },
        temperature: options.temperature ?? 0.4,
        topP: options.top_p ?? 0.9,
        maxOutputTokens: options.max_output_tokens ?? 4096,
        responseMimeType: options.response_mime_type ?? 'application/json',
      },
      safetySettings: [
        // Minimal safety thresholds for food/cooking content
        {
          category: HarmCategory.HARM_CATEGORY_HARASSMENT,
          threshold: HarmBlockThreshold.BLOCK_ONLY_HIGH,
        },
        {
          category: HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT,
          threshold: HarmBlockThreshold.BLOCK_ONLY_HIGH,
        },
      ],
    });
  }

  /**
   * Generates content with automatic retry on rate limit (429) and server errors (5xx).
   */
  async generateWithRetry(model, parts, maxRetries = 3) {
    let lastError;
    for (let attempt = 1; attempt <= maxRetries; attempt++) {
      try {
        const result = await model.generateContent(parts);
        const response = await result.response;
        const text = response.text();
        return JSON.parse(text);
      } catch (error) {
        lastError = error;
        const isRetryable = error.status === 429 || error.status >= 500;
        if (!isRetryable || attempt === maxRetries) break;

        // Exponential backoff with jitter
        const backoffMs = Math.min(1000 * Math.pow(2, attempt) + Math.random() * 500, 30000);
        console.warn(`[GeminiService] Attempt ${attempt} failed. Retrying in ${backoffMs}ms. Error: ${error.message}`);
        await new Promise(resolve => setTimeout(resolve, backoffMs));
      }
    }
    throw new Error(`Gemini API failed after ${maxRetries} attempts: ${lastError?.message}`);
  }

  /**
   * Converts an Appwrite Storage file URL to a base64 Gemini inline part.
   * @param {string} fileUrl - Publicly accessible URL or pre-signed URL
   * @param {string} mimeType - 'image/jpeg', 'video/mp4', etc.
   */
  async fileUrlToInlinePart(fileBuffer, mimeType) {
    const base64Data = fileBuffer.toString('base64');
    return {
      inlineData: {
        data: base64Data,
        mimeType: mimeType,
      },
    };
  }
}
```

### 4.3 Agent 1 — Planner Agent Implementation

**File:** `appwrite-functions/kitchenlens-pipeline/src/agents/plannerAgent.js`

```javascript
import { Storage } from 'node-appwrite';
import { GeminiService } from '../services/geminiService.js';
import { ThoughtSignature } from '../models/thoughtSignature.js';

export class PlannerAgent {
  constructor(client) {
    this.storage = new Storage(client);
    this.gemini = new GeminiService();
  }

  async execute({ session_id, video_file_id, keyframe_file_ids }) {
    const model = this.gemini.getModel({
      thinking_level: 'high',
      temperature: 0.2,
      top_p: 0.85,
      max_output_tokens: 1024,
    });

    // Download first 3 keyframes for quality analysis
    const frameBuffers = await Promise.all(
      keyframe_file_ids.slice(0, 3).map(id =>
        this.storage.getFileDownload(process.env.KEYFRAMES_BUCKET_ID, id)
      )
    );

    const imageParts = await Promise.all(
      frameBuffers.map(buffer => this.gemini.fileUrlToInlinePart(Buffer.from(buffer), 'image/jpeg'))
    );

    const systemPrompt = `You are a video quality analyst for a kitchen ingredient scanning app.
Analyze the provided kitchen/pantry images and output a JSON processing plan.

Required JSON output schema:
{
  "video_quality_score": <float 0.0-1.0>,
  "frame_clarity": <"high"|"medium"|"low">,
  "recommended_sampling_strategy": <"keyframe_1fps"|"keyframe_0.5fps"|"abort">,
  "occlusion_level": <"low"|"medium"|"high">,
  "lighting_condition": <"excellent"|"adequate"|"poor">,
  "estimated_ingredient_regions": [{ "frame": <int>, "region": <string>, "confidence": <float> }],
  "processing_plan": {
    "skip_frames": [<int>],
    "focus_frames": [<int>],
    "apply_contrast_boost": <bool>,
    "apply_sharpness_filter": <bool>
  }
}`;

    const parts = [
      { text: systemPrompt },
      ...imageParts,
      { text: 'Analyze these frames and produce the JSON processing plan.' },
    ];

    const plannerOutput = await this.gemini.generateWithRetry(model, parts);

    // Generate thoughtSignature v1
    return ThoughtSignature.create({
      agent: 'planner',
      version: 1,
      previousSignatureHash: null,
      payload: plannerOutput,
    });
  }
}
```

### 4.4 Agent 2 — Vision Agent Implementation

**File:** `appwrite-functions/kitchenlens-pipeline/src/agents/visionAgent.js`

```javascript
import { Storage } from 'node-appwrite';
import { GeminiService } from '../services/geminiService.js';
import { ThoughtSignature } from '../models/thoughtSignature.js';

export class VisionAgent {
  constructor(client) {
    this.storage = new Storage(client);
    this.gemini = new GeminiService();
  }

  async execute({ thought_signature_v1, keyframe_file_ids, dietary_filters }) {
    const model = this.gemini.getModel({
      thinking_level: 'high',
      media_resolution: 'high', // Maximum resolution for vision inference
      temperature: 0.1,
      top_p: 0.9,
      max_output_tokens: 4096,
    });

    // Use only the focus frames identified by the Planner
    const focusFrameIds = thought_signature_v1.processing_plan.focus_frames
      .map(frameIndex => keyframe_file_ids[frameIndex])
      .filter(Boolean)
      .slice(0, 20); // Hard cap: 20 images per Gemini request

    const frameBuffers = await Promise.all(
      focusFrameIds.map(id =>
        this.storage.getFileDownload(process.env.KEYFRAMES_BUCKET_ID, id)
      )
    );

    const imageParts = await Promise.all(
      frameBuffers.map(buffer => this.gemini.fileUrlToInlinePart(Buffer.from(buffer), 'image/jpeg'))
    );

    const contrastNote = thought_signature_v1.processing_plan.apply_contrast_boost
      ? 'Note: Contrast enhancement was applied to these frames. Account for this in your confidence scoring.'
      : '';

    const systemPrompt = `You are a culinary vision expert. ${contrastNote}
Analyze these kitchen/pantry images and identify ALL visible food ingredients.
The scene has occlusion level: ${thought_signature_v1.occlusion_level}.

${dietary_filters?.length > 0 ? `User has these dietary restrictions: ${dietary_filters.join(', ')}. Flag any allergen-relevant ingredients.` : ''}

Required JSON output schema:
{
  "detected_ingredients": [{
    "id": "ing_<unique_3_digit_number>",
    "canonical_name": <string>,
    "common_name": <string>,
    "quantity": <string or null>,
    "unit": <string or null>,
    "freshness": <"fresh"|"stale"|"unknown">,
    "confidence": <float 0.0-1.0>,
    "source_frame": <int>,
    "bounding_region": <"top-left"|"top-center"|"top-right"|"center-left"|"center"|"center-right"|"bottom-left"|"bottom-center"|"bottom-right">
  }],
  "total_detected": <int>,
  "low_confidence_suppressed": <int>,
  "allergen_flags_detected": [<string>],
  "processing_notes": <string>
}

Only include ingredients with confidence ≥ 0.40. Record but do NOT include ingredients below 0.40 in the total; increment low_confidence_suppressed counter instead.`;

    const parts = [
      { text: systemPrompt },
      ...imageParts,
      { text: 'Identify all food ingredients visible in these images.' },
    ];

    const visionOutput = await this.gemini.generateWithRetry(model, parts);

    return ThoughtSignature.create({
      agent: 'vision',
      version: 2,
      previousSignatureHash: thought_signature_v1._hash,
      payload: visionOutput,
    });
  }
}
```

### 4.5 Agent 3 — Chef Agent Implementation

**File:** `appwrite-functions/kitchenlens-pipeline/src/agents/chefAgent.js`

```javascript
import { Databases } from 'node-appwrite';
import { GeminiService } from '../services/geminiService.js';
import { ThoughtSignature } from '../models/thoughtSignature.js';

export class ChefAgent {
  constructor(client) {
    this.databases = new Databases(client);
    this.gemini = new GeminiService();
  }

  async execute({ thought_signature_v2, dietary_filters, user_id }) {
    const model = this.gemini.getModel({
      thinking_level: 'high',
      temperature: 0.7,
      top_p: 0.95,
      max_output_tokens: 8192,
    });

    // Fetch user's pantry inventory for supplementary context
    let pantryContext = '';
    try {
      const pantry = await this.databases.listDocuments(
        process.env.DATABASE_ID,
        process.env.PANTRY_COLLECTION_ID,
        [`equal("user_id", "${user_id}")`, `equal("status", "available")`]
      );
      if (pantry.documents.length > 0) {
        const pantryItems = pantry.documents.map(d => d.ingredient_name).join(', ');
        pantryContext = `\n\nAdditional pantry items the user likely has (not visible in scan but historically available): ${pantryItems}`;
      }
    } catch {
      // Pantry fetch is non-critical; proceed without it
    }

    const ingredientList = thought_signature_v2.detected_ingredients
      .map(i => `- ${i.canonical_name} (${i.quantity ?? 'some'}, confidence: ${(i.confidence * 100).toFixed(0)}%)`)
      .join('\n');

    const systemPrompt = `You are a world-class chef and nutritionist with expertise in home cooking.

DETECTED INGREDIENTS:
${ingredientList}
${pantryContext}

DIETARY CONSTRAINTS (HARD RULES — MUST be strictly followed, these are not preferences):
${dietary_filters?.length > 0 ? dietary_filters.join(', ') : 'None specified'}

INSTRUCTIONS:
Generate exactly 3 diverse recipe suggestions. For each recipe you MUST:
1. Reason through ingredient combinations that make culinary sense
2. STRICTLY adhere to ALL dietary constraints — a recipe violating any constraint is invalid
3. Prioritize HIGH-confidence ingredients (>0.80) as main components
4. Build complete recipes even if some minor ingredients (condiments, spices) must be assumed available
5. Include a "reasoning" field explaining your culinary logic

Output a JSON object with this schema:
{
  "recipes": [{
    "id": "recipe_<3_digit_number>",
    "title": <string>,
    "description": <string, 1-2 sentences>,
    "dietary_tags": [<string>],
    "prep_time_minutes": <int>,
    "cook_time_minutes": <int>,
    "servings": <int>,
    "difficulty": <"easy"|"medium"|"hard">,
    "ingredients_used": [<ingredient_id_string>],
    "ingredients_list": [{ "name": <string>, "amount": <string>, "unit": <string> }],
    "instructions": [{ "step": <int>, "instruction": <string> }],
    "reasoning": <string>,
    "nutrition_estimate": {
      "calories_per_serving": <int>,
      "protein_g": <int>,
      "carbs_g": <int>,
      "fat_g": <int>
    }
  }]
}`;

    const parts = [{ text: systemPrompt }];
    const chefOutput = await this.gemini.generateWithRetry(model, parts);

    return ThoughtSignature.create({
      agent: 'chef',
      version: 3,
      previousSignatureHash: thought_signature_v2._hash,
      payload: chefOutput,
    });
  }
}
```

### 4.6 ThoughtSignature Model

**File:** `appwrite-functions/kitchenlens-pipeline/src/models/thoughtSignature.js`

```javascript
import { createHash } from 'crypto';

export class ThoughtSignature {
  /**
   * Creates a new ThoughtSignature with a tamper-evident SHA-256 hash chain.
   * @param {object} params
   * @param {string} params.agent - Agent name: 'planner' | 'vision' | 'chef'
   * @param {number} params.version - Signature version: 1 | 2 | 3
   * @param {string|null} params.previousSignatureHash - Hash of previous signature (null for v1)
   * @param {object} params.payload - Agent-specific output payload
   */
  static create({ agent, version, previousSignatureHash, payload }) {
    const signature = {
      agent,
      version,
      previous_signature_hash: previousSignatureHash,
      timestamp: new Date().toISOString(),
      ...payload,
    };

    // Generate tamper-evident hash: SHA256(previousHash + JSON(payload))
    const hashInput = (previousSignatureHash ?? 'genesis') + JSON.stringify(payload);
    signature._hash = createHash('sha256').update(hashInput).digest('hex');

    return signature;
  }

  /**
   * Verifies the integrity of a ThoughtSignature chain.
   * Returns true if the chain is unmodified.
   */
  static verifyChain(signatures) {
    let previousHash = null;
    for (const sig of signatures) {
      const hashInput = (previousHash ?? 'genesis') + JSON.stringify(
        // Reconstruct payload by excluding chain metadata fields
        Object.fromEntries(
          Object.entries(sig).filter(([k]) => !['agent', 'version', 'previous_signature_hash', 'timestamp', '_hash'].includes(k))
        )
      );
      const expectedHash = createHash('sha256').update(hashInput).digest('hex');
      if (sig._hash !== expectedHash) return false;
      previousHash = sig._hash;
    }
    return true;
  }
}
```

---

## 5. Phase 3 — Recipe UI & Streaming Results

### 5.1 Appwrite Realtime Provider

**File:** `lib/features/recipes/presentation/providers/recipe_stream_provider.dart`

```dart
import 'package:appwrite/appwrite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kitchenlens/core/constants/appwrite_constants.dart';

part 'recipe_stream_provider.g.dart';

/// Streams recipe documents from Appwrite Realtime as the Chef Agent creates them.
/// Each new document creation event carries a complete recipe payload.
@riverpod
Stream<List<RecipeEntity>> recipeStream(
  RecipeStreamRef ref, {
  required String sessionId,
}) {
  final realtime = ref.watch(appwriteRealtimeProvider);
  final controller = StreamController<List<RecipeEntity>>();
  final accumulatedRecipes = <RecipeEntity>[];

  // Subscribe to Appwrite Realtime for recipe document creation events
  final subscription = realtime.subscribe([
    // Listen for new documents in the recipes collection belonging to this session
    'databases.${AppwriteConstants.databaseId}'
    '.collections.${AppwriteConstants.recipesCollectionId}'
    '.documents',
  ]);

  subscription.stream.listen((event) {
    // Only process CREATE events for this session
    if (event.events.contains('databases.*.collections.*.documents.*.create')) {
      final payload = event.payload;
      if (payload['scan_id'] == sessionId) {
        final recipe = RecipeModel.fromJson(payload).toEntity();
        accumulatedRecipes.add(recipe);
        controller.add(List.unmodifiable(accumulatedRecipes));
      }
    }
  });

  ref.onDispose(() {
    subscription.close();
    controller.close();
  });

  return controller.stream;
}
```

### 5.2 Streaming Recipe Widget

**File:** `lib/features/recipes/presentation/widgets/streaming_recipe_widget.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class StreamingRecipeWidget extends ConsumerWidget {
  final String sessionId;

  const StreamingRecipeWidget({required this.sessionId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeStream = ref.watch(recipeStreamProvider(sessionId: sessionId));
    final scanStatus = ref.watch(scanStatusProvider(sessionId: sessionId));

    return Column(
      children: [
        // Pipeline status header
        _PipelineStatusBar(scanStatus: scanStatus),

        // Recipe cards stream in as each is generated
        recipeStream.when(
          data: (recipes) => recipes.isEmpty
              ? _buildWaitingState()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recipes.length,
                  itemBuilder: (context, index) => RecipeCardWidget(
                    recipe: recipes[index],
                    // Animate each card in with a slide + fade
                  ).animate()
                    .slideY(begin: 0.3, duration: 400.ms, curve: Curves.easeOutCubic)
                    .fadeIn(duration: 300.ms),
                ),
          loading: () => _buildLoadingSkeletons(),
          error: (err, _) => _buildErrorState(err),
        ),

        // Show "Generating more..." shimmer if pipeline still running
        if (scanStatus == 'processing')
          _buildLoadingSkeletons(count: 1),
      ],
    );
  }

  Widget _buildWaitingState() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          LottieBuilder.asset('assets/animations/cooking.json', height: 120),
          const SizedBox(height: 16),
          const Text(
            'Analyzing your ingredients…',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingSkeletons({int count = 2}) {
    return Column(
      children: List.generate(
        count,
        (_) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 160,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState(Object error) {
    return Center(
      child: Column(
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 8),
          Text('Something went wrong: $error'),
        ],
      ),
    );
  }
}
```

### 5.3 Recipe Detail Page

**File:** `lib/features/recipes/presentation/pages/recipe_detail_page.dart`

```dart
class RecipeDetailPage extends ConsumerWidget {
  final RecipeEntity recipe;

  const RecipeDetailPage({required this.recipe, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Hero app bar with recipe thumbnail
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(recipe.title),
              background: CachedNetworkImage(
                imageUrl: recipe.thumbnailUrl ?? '',
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: const Icon(Icons.restaurant, size: 64),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dietary tags
                  Wrap(
                    spacing: 8,
                    children: recipe.dietaryTags.map((tag) =>
                      Chip(label: Text(tag.toUpperCase()), labelStyle: const TextStyle(fontSize: 11))
                    ).toList(),
                  ),
                  const SizedBox(height: 12),

                  // Time + servings metadata row
                  Row(
                    children: [
                      _MetaChip(icon: Icons.timer, label: '${recipe.prepTimeMinutes + recipe.cookTimeMinutes} min'),
                      const SizedBox(width: 8),
                      _MetaChip(icon: Icons.people, label: '${recipe.servings} servings'),
                      const SizedBox(width: 8),
                      _MetaChip(icon: Icons.fitness_center, label: recipe.difficulty),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Chef's reasoning (expandable)
                  _ReasoningCard(reasoning: recipe.reasoning),
                  const SizedBox(height: 16),

                  // Nutrition estimate
                  if (recipe.nutritionEstimate != null)
                    NutritionBadgeWidget(nutrition: recipe.nutritionEstimate!),
                  const SizedBox(height: 16),

                  // Ingredients list
                  const Text('Ingredients', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ...recipe.ingredientsList.map((ing) => _IngredientRow(ingredient: ing)),
                  const SizedBox(height: 16),

                  // Step-by-step instructions
                  const Text('Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  StepByStepWidget(instructions: recipe.instructions),
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => ref.read(savedRecipesProvider.notifier).toggleSave(recipe),
        icon: Icon(
          ref.watch(isRecipeSavedProvider(recipe.id)) ? Icons.bookmark : Icons.bookmark_outline,
        ),
        label: const Text('Save Recipe'),
      ),
    );
  }
}
```

---

## 6. Offline Queue & Connectivity Handling

### 6.1 Offline Queue Service

**File:** `lib/core/network/offline_queue_service.dart`

```dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offline_queue_service.g.dart';

/// Persisted offline scan queue entry
@collection
class OfflineScanEntry {
  Id id = Isar.autoIncrement;
  late String sessionId;
  late String optimizedVideoPath;
  late List<String> keyframePaths;
  late List<String> dietaryFilters;
  late DateTime createdAt;

  @enumerated
  late OfflineQueueStatus status;
}

enum OfflineQueueStatus { pending, uploading, failed }

@riverpod
class OfflineQueueNotifier extends _$OfflineQueueNotifier {
  late final Isar _isar;

  @override
  Future<List<OfflineScanEntry>> build() async {
    _isar = await ref.watch(isarProvider.future);
    _startConnectivityListener();
    return _isar.offlineScanEntrys.where().findAll();
  }

  void _startConnectivityListener() {
    Connectivity().onConnectivityChanged.listen((result) async {
      if (result != ConnectivityResult.none) {
        await _processQueue();
      }
    });
  }

  Future<void> enqueue({
    required String sessionId,
    required String optimizedVideoPath,
    required List<String> keyframePaths,
    required List<String> dietaryFilters,
  }) async {
    final entry = OfflineScanEntry()
      ..sessionId = sessionId
      ..optimizedVideoPath = optimizedVideoPath
      ..keyframePaths = keyframePaths
      ..dietaryFilters = dietaryFilters
      ..createdAt = DateTime.now()
      ..status = OfflineQueueStatus.pending;

    await _isar.writeTxn(() async {
      await _isar.offlineScanEntrys.put(entry);
    });

    ref.invalidateSelf();
  }

  Future<void> _processQueue() async {
    final pendingEntries = await _isar.offlineScanEntrys
        .filter()
        .statusEqualTo(OfflineQueueStatus.pending)
        .findAll();

    for (final entry in pendingEntries) {
      try {
        // Mark as uploading
        await _isar.writeTxn(() async {
          entry.status = OfflineQueueStatus.uploading;
          await _isar.offlineScanEntrys.put(entry);
        });

        // Dispatch through the upload flow
        await ref.read(uploadNotifierProvider.notifier).processAndUpload(
          rawVideoPath: entry.optimizedVideoPath, // Already processed
          sessionId: entry.sessionId,
          dietaryFilters: entry.dietaryFilters,
        );

        // Remove from queue on success
        await _isar.writeTxn(() async {
          await _isar.offlineScanEntrys.delete(entry.id);
        });
      } catch (e) {
        await _isar.writeTxn(() async {
          entry.status = OfflineQueueStatus.failed;
          await _isar.offlineScanEntrys.put(entry);
        });
      }
    }

    ref.invalidateSelf();
  }
}
```

### 6.2 Offline Banner Widget

**File:** `lib/shared/widgets/offline_banner.dart`

```dart
class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivity = ref.watch(connectivityProvider);
    final queueCount = ref.watch(offlineQueueCountProvider);

    return AnimatedSlide(
      offset: connectivity == ConnectivityResult.none ? Offset.zero : const Offset(0, -1),
      duration: const Duration(milliseconds: 300),
      child: Container(
        width: double.infinity,
        color: Colors.orange.shade700,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            const Icon(Icons.wifi_off, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                queueCount > 0
                    ? 'Offline — $queueCount scan(s) queued for upload'
                    : 'You\'re offline — scans will upload when connected',
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 7. Appwrite Configuration

### 7.1 Appwrite Constants

**File:** `lib/core/constants/appwrite_constants.dart`

```dart
abstract class AppwriteConstants {
  // Project
  static const String projectId = String.fromEnvironment('APPWRITE_PROJECT_ID');
  static const String endpoint = String.fromEnvironment(
    'APPWRITE_ENDPOINT',
    defaultValue: 'https://cloud.appwrite.io/v1',
  );

  // Database
  static const String databaseId = 'kitchenlens-db';

  // Collections
  static const String userProfilesCollectionId = 'user_profiles';
  static const String ingredientScansCollectionId = 'ingredient_scans';
  static const String recipesCollectionId = 'recipes';
  static const String pantryInventoryCollectionId = 'pantry_inventory';

  // Buckets
  static const String videosBucketId = 'scan-videos';
  static const String keyframesBucketId = 'keyframes';

  // Functions
  static const String pipelineFunctionId = 'kitchenlens-pipeline';
}
```

### 7.2 Appwrite Client Provider

**File:** `lib/core/storage/appwrite_client_provider.dart`

```dart
import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchenlens/core/constants/appwrite_constants.dart';

final appwriteClientProvider = Provider<Client>((ref) {
  return Client()
    ..setEndpoint(AppwriteConstants.endpoint)
    ..setProject(AppwriteConstants.projectId)
    ..setSelfSigned(status: false); // true only for local dev with self-signed cert
});

final appwriteAccountProvider = Provider<Account>((ref) {
  return Account(ref.watch(appwriteClientProvider));
});

final appwriteDatabasesProvider = Provider<Databases>((ref) {
  return Databases(ref.watch(appwriteClientProvider));
});

final appwriteStorageProvider = Provider<Storage>((ref) {
  return Storage(ref.watch(appwriteClientProvider));
});

final appwriteRealtimeProvider = Provider<Realtime>((ref) {
  return Realtime(ref.watch(appwriteClientProvider));
});

final appwriteFunctionsProvider = Provider<Functions>((ref) {
  return Functions(ref.watch(appwriteClientProvider));
});
```

---

## 8. Environment Configuration

### 8.1 Flutter Environment Variables (dart-define)

KitchenLens uses `--dart-define` for environment isolation. No secrets should be in the app bundle.

**Development:**
```bash
flutter run \
  --dart-define=APPWRITE_PROJECT_ID=your-dev-project-id \
  --dart-define=APPWRITE_ENDPOINT=http://localhost/v1
```

**Production build:**
```bash
flutter build apk --release \
  --dart-define=APPWRITE_PROJECT_ID=prod-project-id \
  --dart-define=APPWRITE_ENDPOINT=https://cloud.appwrite.io/v1
```

### 8.2 Appwrite Function Environment Variables

**File:** `appwrite-functions/kitchenlens-pipeline/.env.example`

```dotenv
# Appwrite
APPWRITE_FUNCTION_API_ENDPOINT=https://cloud.appwrite.io/v1
APPWRITE_FUNCTION_PROJECT_ID=your-project-id
APPWRITE_API_KEY=your-server-api-key

# Gemini
GEMINI_API_KEY=your-gemini-api-key

# Appwrite Resource IDs
DATABASE_ID=kitchenlens-db
VIDEOS_BUCKET_ID=scan-videos
KEYFRAMES_BUCKET_ID=keyframes
SCANS_COLLECTION_ID=ingredient_scans
RECIPES_COLLECTION_ID=recipes
PANTRY_COLLECTION_ID=pantry_inventory
```

**Security note:** These variables are set in the Appwrite Console under the Function's settings (Settings → Environment Variables). They are **never** committed to version control.

---

## 9. Testing Strategy

### 9.1 Unit Tests

**Coverage Target:** ≥80% on Domain + Data layers.

```dart
// test/unit/features/scan/video_processor_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFFmpegKit extends Mock implements FFmpegKit {}

void main() {
  group('VideoProcessorDataSource', () {
    late VideoProcessorDataSource processor;
    late MockFFmpegKit mockFFmpeg;

    setUp(() {
      mockFFmpeg = MockFFmpegKit();
      processor = VideoProcessorDataSource(MockAppLogger());
    });

    test('processVideoForUpload returns path when FFmpeg succeeds', () async {
      // Arrange
      when(() => mockFFmpeg.execute(any())).thenAnswer(
        (_) async => MockFFmpegSession(returnCode: ReturnCode(0)),
      );

      // Act
      final result = await processor.processVideoForUpload('/test/input.mp4');

      // Assert
      expect(result, contains('processed_'));
      expect(result, endsWith('.mp4'));
    });

    test('processVideoForUpload throws VideoProcessingException on FFmpeg failure', () async {
      when(() => mockFFmpeg.execute(any())).thenAnswer(
        (_) async => MockFFmpegSession(returnCode: ReturnCode(1)),
      );

      expect(
        () => processor.processVideoForUpload('/test/input.mp4'),
        throwsA(isA<VideoProcessingException>()),
      );
    });
  });
}
```

### 9.2 Integration Tests

**File:** `test/integration/scan_to_recipe_flow_test.dart`

```dart
// Tests the full scan → upload → pipeline trigger → recipe stream flow
// Uses Appwrite test project and mocked Gemini responses

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Full scan flow produces recipe cards', (tester) async {
    // 1. Launch app
    app.main();
    await tester.pumpAndSettle();

    // 2. Sign in
    await tester.tap(find.byKey(const Key('sign_in_button')));
    await tester.pumpAndSettle();

    // 3. Navigate to scan
    await tester.tap(find.byKey(const Key('start_scan_button')));
    await tester.pumpAndSettle();

    // 4. Simulate recording (inject mock video file)
    // ...

    // 5. Wait for recipe cards to appear
    await tester.pumpAndSettle(const Duration(seconds: 30));
    expect(find.byType(RecipeCardWidget), findsAtLeastNWidgets(1));
  });
}
```

### 9.3 Appwrite Function Tests (Node.js)

```javascript
// appwrite-functions/kitchenlens-pipeline/tests/plannerAgent.test.js
import { describe, it, expect, vi } from 'vitest';
import { PlannerAgent } from '../src/agents/plannerAgent.js';

describe('PlannerAgent', () => {
  it('returns quality_too_low when score < 0.4', async () => {
    const mockGemini = {
      getModel: vi.fn().mockReturnValue({}),
      generateWithRetry: vi.fn().mockResolvedValue({
        video_quality_score: 0.2,
        frame_clarity: 'low',
        recommended_sampling_strategy: 'abort',
      }),
      fileUrlToInlinePart: vi.fn().mockResolvedValue({}),
    };

    const agent = new PlannerAgent(null);
    agent.gemini = mockGemini;
    agent.storage = { getFileDownload: vi.fn().mockResolvedValue(Buffer.from('')) };

    const result = await agent.execute({
      session_id: 'test-session',
      video_file_id: 'file-123',
      keyframe_file_ids: ['kf-1', 'kf-2', 'kf-3'],
    });

    expect(result.video_quality_score).toBeLessThan(0.4);
  });
});
```

---

## 10. Build & Deployment

### 10.1 Local Development Setup

```bash
# 1. Install Flutter 3.22+
flutter --version

# 2. Install dependencies
flutter pub get

# 3. Run code generation (Riverpod, Freezed, JSON serializable, Isar)
dart run build_runner build --delete-conflicting-outputs

# 4. Start local Appwrite (Docker)
docker run -it --rm \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume "$(pwd)"/appwrite:/usr/src/code/appwrite:rw \
  --entrypoint="install" \
  appwrite/appwrite:1.5.0

# 5. Run Flutter app (development)
flutter run \
  --dart-define=APPWRITE_PROJECT_ID=local-project \
  --dart-define=APPWRITE_ENDPOINT=http://localhost/v1

# 6. Deploy Appwrite Function locally
cd appwrite-functions/kitchenlens-pipeline
npm install
appwrite functions createDeployment \
  --functionId=kitchenlens-pipeline \
  --entrypoint="src/index.js" \
  --code="."
```

### 10.2 CI/CD Pipeline (GitHub Actions)

```yaml
# .github/workflows/flutter_ci.yml
name: KitchenLens CI

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.22.0'
      - run: flutter pub get
      - run: dart run build_runner build --delete-conflicting-outputs
      - run: flutter analyze
      - run: flutter test --coverage
      - uses: codecov/codecov-action@v4

  build_android:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: dart run build_runner build --delete-conflicting-outputs
      - run: flutter build apk --release
          --dart-define=APPWRITE_PROJECT_ID=${{ secrets.APPWRITE_PROJECT_ID }}
          --dart-define=APPWRITE_ENDPOINT=${{ secrets.APPWRITE_ENDPOINT }}

  build_ios:
    needs: test
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: dart run build_runner build --delete-conflicting-outputs
      - run: flutter build ipa --release --no-codesign

  deploy_functions:
    needs: test
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    steps:
      - uses: actions/checkout@v4
      - uses: appwrite/setup-appwrite@v1
        with:
          version: '5.0.0'
      - run: |
          appwrite deploy function \
            --functionId=kitchenlens-pipeline \
            --project=${{ secrets.APPWRITE_PROJECT_ID }} \
            --endpoint=${{ secrets.APPWRITE_ENDPOINT }}
        env:
          APPWRITE_API_KEY: ${{ secrets.APPWRITE_API_KEY }}
```

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
