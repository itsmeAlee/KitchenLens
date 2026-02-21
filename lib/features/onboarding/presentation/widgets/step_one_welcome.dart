import 'package:flutter/material.dart';
import 'package:kitchen_lens/core/theme/app_colors.dart';
import 'package:kitchen_lens/core/theme/app_dimensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StepOneWelcome extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const StepOneWelcome({super.key, required this.onNext, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

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
                    colors: isDark
                        ? [
                            Colors.green.shade900.withAlpha(50),
                            Colors.green.shade800.withAlpha(50),
                          ]
                        : [Colors.green.shade50, Colors.green.shade100],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuDUw-h7mB6Z2GyEJEcme-BEmYU7mtfb4mNF98fYpXGTaur22GI31vwTbZHrxbMxwrx-I5tJAnZEycKsG9smo183xHFld8_DVvwffkRPMsbHYMDdC5Eugmrrng6JIAwwz6hQpoh9cWtMquSDFc6Jf4nb5IEN6GdFI2tc7A3a3yL-J2ovW-wOyMvKKJzehhBuHsyKo2r1SKJ4-9dj3rxg-dl_zWcC60PKtNiAPh0Ct7vj1XWRbUrcJGzObjM43XgYiOShZVDXfFBEEyIk',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withAlpha(150),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
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
                          color: Colors.white.withAlpha(25),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                                  LucideIcons.scanLine,
                                  color: Colors.white,
                                  size: 36,
                                )
                                .animate(
                                  onPlay: (controller) =>
                                      controller.repeat(reverse: true),
                                )
                                .fadeIn()
                                .scale(),
                            const SizedBox(height: 8),
                            const Text(
                              'Matching Inventory...',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 500.ms).scale(begin: const Offset(0.9, 0.9)),
            ),
            const Spacer(),

            // Text Content
            Text(
              'Intelligent\nRecipe Discovery',
              textAlign: TextAlign.center,
              style: theme.textTheme.displaySmall,
            ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),
            const SizedBox(height: AppDimensions.md),
            Text(
              'Reasoning about recipes tailored to your unique dietary profile and inventory.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
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
                    color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
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
