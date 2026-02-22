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
                      color: AppColors.surfaceVariant,
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
                      color: AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),

            // Header Content
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.verified_user_outlined,
                size: 32,
                color: AppColors.primary,
              ),
            ).animate().scale(delay: 200.ms, begin: const Offset(0.5, 0.5)),
            const SizedBox(height: 24),
            Text(
              'Before we start',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                letterSpacing: -1,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2),
            const SizedBox(height: 12),
            Text(
              'KitchenLens needs a couple of permissions to work its magic in your kitchen.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),
            const SizedBox(height: AppDimensions.xxl),

            // Permission Toggles
            _buildPermissionCard(
              theme: theme,
              icon: LucideIcons.camera,
              title: 'Camera',
              subtitle: 'For instant ingredient detection',
              value: _cameraEnabled,
              onChanged: (val) => setState(() => _cameraEnabled = val),
            ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
            const SizedBox(height: AppDimensions.md),

            _buildPermissionCard(
              theme: theme,
              icon: LucideIcons.bellRing,
              title: 'Notifications',
              subtitle: 'Daily personalized recipe ideas',
              value: _notifEnabled,
              onChanged: (val) => setState(() => _notifEnabled = val),
            ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1),

            // Privacy Notice
            const SizedBox(height: AppDimensions.xl),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.lock_outline,
                    size: 20,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'We only use these permissions to provide the core service. Your data never leaves your device unencrypted.',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.1),

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
                  color: AppColors.textSecondary,
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
  }) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        border: Border.all(color: Colors.transparent),
        boxShadow: [
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
              color: AppColors.primary.withAlpha(25), // 0.1 opacity
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
            inactiveTrackColor: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
