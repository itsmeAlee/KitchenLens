import 'package:flutter/material.dart';
import 'package:kitchen_lens/core/theme/app_colors.dart';
import 'package:kitchen_lens/core/theme/app_dimensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StepTwoPermissions extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const StepTwoPermissions({
    super.key,
    required this.onNext,
    required this.onSkip,
  });

  @override
  State<StepTwoPermissions> createState() => _StepTwoPermissionsState();
}

class _StepTwoPermissionsState extends State<StepTwoPermissions> {
  bool _cameraEnabled = true;
  bool _notifEnabled = true;

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
            // Page Indicators
            Padding(
              padding: const EdgeInsets.only(
                top: AppDimensions.xl,
                bottom: AppDimensions.xl,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.grey.shade700
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 8),
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
                      color: isDark
                          ? Colors.grey.shade700
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),

            // Header Content
            Text(
              'System Access',
              style: theme.textTheme.displaySmall,
            ).animate().fadeIn().slideY(begin: 0.1),
            const SizedBox(height: AppDimensions.sm),
            Text(
              'Grant permissions to enable AI ingredient detection and recipe updates.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1),
            const SizedBox(height: AppDimensions.xxl),

            // Permission Toggles
            _buildPermissionCard(
              theme: theme,
              icon: LucideIcons.camera,
              title: 'Camera',
              subtitle: 'For instant ingredient detection',
              value: _cameraEnabled,
              onChanged: (val) => setState(() => _cameraEnabled = val),
              isDark: isDark,
            ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
            const SizedBox(height: AppDimensions.md),

            _buildPermissionCard(
              theme: theme,
              icon: LucideIcons.bellRing,
              title: 'Notifications',
              subtitle: 'Daily personalized recipe ideas',
              value: _notifEnabled,
              onChanged: (val) => setState(() => _notifEnabled = val),
              isDark: isDark,
            ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1),

            // Privacy Notice
            const SizedBox(height: AppDimensions.xl),
            Container(
              padding: const EdgeInsets.all(AppDimensions.md),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.blue.shade900.withAlpha(50)
                    : Colors.blue.shade50,
                borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                border: Border.all(
                  color: isDark ? Colors.blue.shade900 : Colors.blue.shade100,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    LucideIcons.shieldCheck,
                    color: isDark ? Colors.blue.shade300 : Colors.blue.shade600,
                    size: 20,
                  ),
                  const SizedBox(width: AppDimensions.sm),
                  Expanded(
                    child: Text(
                      'We value your privacy. Data processing happens locally on your device for maximum security.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: isDark
                            ? Colors.blue.shade200
                            : Colors.blue.shade900,
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1),

            const Spacer(),

            // Actions
            FilledButton(
              onPressed: widget.onNext,
              child: const Text('Continue'),
            ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1),
            const SizedBox(height: AppDimensions.sm),
            TextButton(
              onPressed: widget.onSkip,
              child: Text(
                'Skip for now',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.textSecondaryLight,
                ),
              ),
            ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.1),
            const SizedBox(height: AppDimensions.lg),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionCard({
    required ThemeData theme,
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        border: Border.all(
          color: isDark ? AppColors.surfaceVariantDark : Colors.transparent,
        ),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(
                isDark ? 51 : 25,
              ), // 0.2 / 0.1 opacity
              borderRadius: BorderRadius.circular(AppDimensions.radiusMax),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: AppDimensions.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleMedium),
                Text(subtitle, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: AppColors.primary,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: isDark
                ? Colors.grey.shade800
                : Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
