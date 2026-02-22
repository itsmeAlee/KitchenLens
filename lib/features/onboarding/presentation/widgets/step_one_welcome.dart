import 'package:flutter/material.dart';
import 'package:kitchen_lens/core/theme/app_colors.dart';
import 'package:kitchen_lens/core/theme/app_dimensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StepOneWelcome extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const StepOneWelcome({super.key, required this.onNext, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.screenPadding,
        ),
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(
                top: AppDimensions.xl,
                bottom: AppDimensions.md,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LucideIcons.aperture,
                    color: AppColors.primary,
                    size: AppDimensions.iconLg,
                  ),
                  const SizedBox(width: AppDimensions.xs),
                  Text(
                    'KitchenLens',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),

            // Hero Image Container
            Center(
              child: Container(
                width: 280,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                    colors: [Colors.green.shade50, Colors.green.shade100],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: 'https://images.unsplash.com/photo-1556910103-1c02745aae4d?q=80&w=1000&auto=format&fit=crop',
                        fit: BoxFit.cover,
                        memCacheWidth: 800, // Added memCacheWidth
                      ),
                      // Gradient Overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              AppColors.textPrimary.withAlpha(128),
                              AppColors.textPrimary.withAlpha(230),
                            ],
                          ),
                        ),
                      ),
                      // Simulated Scanner Overlay
                      Center(
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primary.withAlpha(128),
                            ),
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusMd,
                            ),
                            color: AppColors.textPrimary.withAlpha(25),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                LucideIcons.scanLine,
                                color: AppColors.textPrimary,
                                size: 36,
                              )
                                  .animate(
                                onPlay: (controller) =>
                                    controller.repeat(reverse: true),
                              )
                                  .fadeIn()
                                  .scale(),
                              const SizedBox(height: 8),
                              Text(
                                'Matching Inventory...',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                    ],
                  ),
                ),
            ).animate().fadeIn(duration: 500.ms).scale(begin: const Offset(0.9, 0.9)),
            const Spacer(),

            // Text Content
            Text(
              'See what\'s cooking',
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w800,
                height: 1.1,
                letterSpacing: -1,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),
            const SizedBox(height: AppDimensions.md),
            Text(
              'Point your camera at any ingredients and let KitchenLens craft the perfect recipe for you.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),
            const Spacer(),

            // Page Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 32,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.lg),

            // Get Started Button
            FilledButton(
              onPressed: onNext,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Get Started'),
                  const SizedBox(width: 8),
                  Icon(LucideIcons.arrowRight, size: 20),
                ],
              ),
            ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2),

            const SizedBox(height: AppDimensions.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: theme.textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: onSkip,
                  child: Text(
                    'Sign In',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.textTheme.displayLarge?.color,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.lg),
          ],
        ),
      ),
    );
  }
}
