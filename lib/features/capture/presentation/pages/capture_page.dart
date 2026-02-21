import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchen_lens/core/theme/app_colors.dart';
import 'package:kitchen_lens/core/theme/app_dimensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CapturePage extends StatefulWidget {
  const CapturePage({super.key});

  @override
  State<CapturePage> createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> {
  bool _isPhoto = true;
  bool _isFlashOn = false;
  bool _isSettingsOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Camera view is always black background
      body: Stack(
        children: [
          // Simulated Camera Preview
          Positioned.fill(
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDDKDKW9KBpXgAeoDm2wd9cAz16G6YXiO5oGw_2j74f-dRZFowUsbsVpupBaffUV5cIT_oKJNbXtDsrjtlFialhLgeV7WQqGtvPEHcq_9H-3_i-QMCODCaPybyxivOVw3Uoy8eX9G2ya09C7WaZfWEwv13cDiNynx8ab-lik2kruk9FNHBG9pu5yXsITskj3HfEGnMFEWZPekbvdgyj5hHnbcGE3oxGMK4S57Yx19bu2g0xVOFzp-0eIsYYaP7I0eL_SWzP_0c94To1',
              fit: BoxFit.cover,
            ),
          ),

          // Dark Overlay for better contrast on camera
          Positioned.fill(child: Container(color: Colors.black.withAlpha(50))),

          // Top Controls Area
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.screenPadding,
                vertical: AppDimensions.md,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildGlassButton(
                    icon: LucideIcons.chevronLeft,
                    onTap: () => context.pop(),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.md,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(150),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMax,
                      ),
                      border: Border.all(color: Colors.white.withAlpha(50)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.camera,
                          color: AppColors.primary,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'KitchenLens AI',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 100.ms).slideY(begin: -0.2),

                  Row(
                    children: [
                      _buildGlassButton(
                        icon: _isFlashOn ? LucideIcons.zap : LucideIcons.zapOff,
                        onTap: () => setState(() => _isFlashOn = !_isFlashOn),
                      ),
                      const SizedBox(width: AppDimensions.sm),
                      _buildGlassButton(
                        icon: LucideIcons.settings,
                        onTap: () =>
                            setState(() => _isSettingsOpen = !_isSettingsOpen),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Center Alignment Box focus area indicator
          Center(
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withAlpha(128),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
                  ),
                  child: Stack(
                    children: [
                      // Corner accents
                      _buildCornerAccent(Alignment.topLeft),
                      _buildCornerAccent(Alignment.topRight),
                      _buildCornerAccent(Alignment.bottomLeft),
                      _buildCornerAccent(Alignment.bottomRight),
                    ],
                  ),
                ),
              )
              .animate()
              .fadeIn(delay: 300.ms)
              .scale(begin: const Offset(0.9, 0.9)),

          // Bottom Controls Area
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                AppDimensions.screenPadding,
                AppDimensions.xl,
                AppDimensions.screenPadding,
                AppDimensions.xl + MediaQuery.of(context).padding.bottom,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withAlpha(230)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Align ingredients within frame',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ).animate().fadeIn(delay: 400.ms),
                  const SizedBox(height: AppDimensions.xl),

                  // Camera Modes Toggle
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(150),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMax,
                      ),
                      border: Border.all(color: Colors.white.withAlpha(50)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildModeToggle(
                          title: 'Photo',
                          isSelected: _isPhoto,
                          onTap: () => setState(() => _isPhoto = true),
                        ),
                        _buildModeToggle(
                          title: 'Video',
                          isSelected: !_isPhoto,
                          onTap: () => setState(() => _isPhoto = false),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2),
                  const SizedBox(height: AppDimensions.xxl),

                  // Actions Row: Gallery, Shutter, Switch Camera
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Gallery Image Picker Placeholder
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(50),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withAlpha(128),
                          ),
                        ),
                        child: const Icon(
                          LucideIcons.image,
                          color: Colors.white,
                          size: 24,
                        ),
                      ).animate().fadeIn(delay: 600.ms).slideX(begin: -0.5),

                      // Shutter Button
                      GestureDetector(
                        onTap: () {
                          // Trigger capture and go to processing
                          context.push('/upload');
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(
                            4,
                          ), // For the outer ring gap
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: _isPhoto ? Colors.white : Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ).animate().fadeIn(delay: 600.ms).scale(),

                      // Switch Camera
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(150),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          LucideIcons.refreshCcw,
                          color: Colors.white,
                          size: 24,
                        ),
                      ).animate().fadeIn(delay: 600.ms).slideX(begin: 0.5),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMax),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(50),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withAlpha(50)),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
        ),
      ),
    );
  }

  Widget _buildCornerAccent(Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border(
            top:
                (alignment == Alignment.topLeft ||
                    alignment == Alignment.topRight)
                ? const BorderSide(color: AppColors.primary, width: 4)
                : BorderSide.none,
            bottom:
                (alignment == Alignment.bottomLeft ||
                    alignment == Alignment.bottomRight)
                ? const BorderSide(color: AppColors.primary, width: 4)
                : BorderSide.none,
            left:
                (alignment == Alignment.topLeft ||
                    alignment == Alignment.bottomLeft)
                ? const BorderSide(color: AppColors.primary, width: 4)
                : BorderSide.none,
            right:
                (alignment == Alignment.topRight ||
                    alignment == Alignment.bottomRight)
                ? const BorderSide(color: AppColors.primary, width: 4)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildModeToggle({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMax),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
