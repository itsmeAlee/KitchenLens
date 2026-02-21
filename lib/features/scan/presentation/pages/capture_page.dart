import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import 'dart:async';

class CapturePage extends StatefulWidget {
  const CapturePage({super.key});

  @override
  State<CapturePage> createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> {
  bool _isVideoMode = true;
  bool _isRecording = false;
  bool _flashEnabled = false;
  int _recordingSeconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // In a real app we'd parse this from the GoRouter query param
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final mode = GoRouterState.of(context).uri.queryParameters['mode'];
    //   if (mode == 'photo') setState(() => _isVideoMode = false);
    // });
  }

  void _toggleMode() {
    if (_isRecording) return;
    setState(() => _isVideoMode = !_isVideoMode);
  }

  void _recordToggle() {
    if (_isVideoMode) {
      if (_isRecording) {
        _stopRecording();
      } else {
        _startRecording();
      }
    } else {
      _takePhoto();
    }
  }

  void _startRecording() {
    setState(() {
      _isRecording = true;
      _recordingSeconds = 30; // 30 sec max timer
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_recordingSeconds > 0) {
          _recordingSeconds--;
        } else {
          _stopRecording();
        }
      });
    });
  }

  void _stopRecording() {
    _timer?.cancel();
    setState(() => _isRecording = false);
    // Navigate to upload
    context.pushReplacement('/upload');
  }

  void _takePhoto() {
    // Navigate to upload
    context.pushReplacement('/upload');
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Camera background
      body: SafeArea(
        child: Stack(
          children: [
            // Mock Camera Preview
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuCN6H_3ND6yDxjsUOUc-o4BDo3zVaQpcTQJv60cHg4K28sQCMJzbJOzVmzehuA-C3PgC5I2TcYwlYWP10KRnGtpJybISu0O9khP_hrBgoaX9_1sIdAc0rtefSoZ72xJpX3iZKJ4AiUFzN0HttF_ZY45m7gEe0crA51USd_ZGvj_x0_1OC5lCu3GMTVGBMZb6tzHZneKGVmuArgVY_hd1JnoHqZid_tZ1aCJrkVqPRn18QN6d9VBjP_13O_llOpZdnvhponxndyWOgGu',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(color: Colors.black.withOpacity(0.2)),
              ),
            ),

            // Top Controls
            Positioned(
              top: AppDimensions.md,
              left: AppDimensions.md,
              right: AppDimensions.md,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _glassButton(
                    onTap: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/home');
                      }
                    },
                    icon: Icons.close,
                  ),
                  if (_isVideoMode)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.md,
                        vertical: AppDimensions.xs,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: AppDimensions.borderRadiusFull,
                      ),
                      child: Text(
                        '00:${_recordingSeconds.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  _glassButton(
                    onTap: () => setState(() => _flashEnabled = !_flashEnabled),
                    icon: _flashEnabled ? Icons.flash_on : Icons.flash_off,
                    iconColor: _flashEnabled ? AppColors.warning : Colors.white,
                  ),
                ],
              ),
            ),

            // Bottom Controls
            Positioned(
              bottom: AppDimensions.xl,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // Mode Toggle
                  if (!_isRecording)
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: AppDimensions.borderRadiusFull,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _modeButton('Video', _isVideoMode),
                          _modeButton('Photo', !_isVideoMode),
                        ],
                      ),
                    ),
                  const SizedBox(height: AppDimensions.xl),

                  // Record / Shutter Button
                  GestureDetector(
                    onTap: _recordToggle,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (_isRecording)
                          SizedBox(
                            width: 84,
                            height: 84,
                            child: CircularProgressIndicator(
                              value: 1 - (_recordingSeconds / 30),
                              color: AppColors.primary,
                              strokeWidth: 4,
                            ),
                          ),
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                          ),
                          child: Center(
                            child: Container(
                              width: _isRecording ? 28 : 56,
                              height: _isRecording ? 28 : 56,
                              decoration: BoxDecoration(
                                color: _isVideoMode
                                    ? AppColors.primary
                                    : Colors.white,
                                borderRadius: _isRecording
                                    ? BorderRadius.circular(8)
                                    : AppDimensions.borderRadiusFull,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _glassButton({
    required VoidCallback onTap,
    required IconData icon,
    Color iconColor = Colors.white,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.sm),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }

  Widget _modeButton(String title, bool isActive) {
    return GestureDetector(
      onTap: _isRecording
          ? null
          : () => setState(() => _isVideoMode = title == 'Video'),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.lg,
          vertical: AppDimensions.xs,
        ),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: AppDimensions.borderRadiusFull,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.white,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
