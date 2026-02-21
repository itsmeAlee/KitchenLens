import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchen_lens/core/theme/app_colors.dart';
import 'package:kitchen_lens/core/theme/app_dimensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _pushNotifications = true;
  bool _dietaryAlerts = true;
  bool _saveScans = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Settings'),
        centerTitle: true,
        backgroundColor: isDark
            ? AppColors.backgroundDark
            : AppColors.backgroundLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.logOut),
            onPressed: () {
              // Sign out logic...
              context.go('/auth');
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.screenPadding,
          vertical: AppDimensions.md,
        ),
        children: [
          // Profile Header
          Center(
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 3),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuDDKDKW9KBpXgAeoDm2wd9cAz16G6YXiO5oGw_2j74f-dRZFowUsbsVpupBaffUV5cIT_oKJNbXtDsrjtlFialhLgeV7WQqGtvPEHcq_9H-3_i-QMCODCaPybyxivOVw3Uoy8eX9G2ya09C7WaZfWEwv13cDiNynx8ab-lik2kruk9FNHBG9pu5yXsITskj3HfEGnMFEWZPekbvdgyj5hHnbcGE3oxGMK4S57Yx19bu2g0xVOFzp-0eIsYYaP7I0eL_SWzP_0c94To1',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ).animate().scale().fadeIn(),
                const SizedBox(height: AppDimensions.md),
                Text(
                  'Chef Alex',
                  style: theme.textTheme.titleLarge,
                ).animate().fadeIn(delay: 100.ms),
                Text(
                  'Premium Member',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: AppColors.primary,
                  ),
                ).animate().fadeIn(delay: 150.ms),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.xl),

          // Stats Grid
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  theme,
                  isDark,
                  'Recipes Cooked',
                  '42',
                  LucideIcons.chefHat,
                ),
              ),
              const SizedBox(width: AppDimensions.md),
              Expanded(
                child: _buildStatCard(
                  theme,
                  isDark,
                  'Items Scanned',
                  '156',
                  LucideIcons.scanLine,
                ),
              ),
              const SizedBox(width: AppDimensions.md),
              Expanded(
                child: _buildStatCard(
                  theme,
                  isDark,
                  'Waste Saved',
                  '12kg',
                  LucideIcons.leaf,
                ),
              ),
            ],
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
          const SizedBox(height: AppDimensions.xxl),

          // Preferences Segment
          Text(
            'PREFERENCES',
            style: theme.textTheme.labelSmall?.copyWith(letterSpacing: 1.2),
          ).animate().fadeIn(delay: 300.ms),
          const SizedBox(height: AppDimensions.sm),
          _buildSettingsGroup(
            isDark,
            children: [
              _buildSettingsListTile(
                theme,
                isDark,
                title: 'Dietary Profile',
                subtitle: 'Vegetarian, Nut Allergy',
                icon: LucideIcons.apple,
                onTap: () {},
              ),
              const Divider(height: 1),
              _buildSettingsListTile(
                theme,
                isDark,
                title: 'Theme',
                subtitle: 'System Default',
                icon: LucideIcons.moon,
                onTap: () {},
              ),
            ],
          ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1),

          const SizedBox(height: AppDimensions.xl),
          // App Settings Segment
          Text(
            'APP SETTINGS',
            style: theme.textTheme.labelSmall?.copyWith(letterSpacing: 1.2),
          ).animate().fadeIn(delay: 500.ms),
          const SizedBox(height: AppDimensions.sm),
          _buildSettingsGroup(
            isDark,
            children: [
              _buildSwitchTile(
                theme,
                isDark,
                title: 'Push Notifications',
                icon: LucideIcons.bell,
                value: _pushNotifications,
                onChanged: (val) => setState(() => _pushNotifications = val),
              ),
              const Divider(height: 1),
              _buildSwitchTile(
                theme,
                isDark,
                title: 'Dietary Warning Alerts',
                icon: Icons.warning_amber_rounded,
                value: _dietaryAlerts,
                onChanged: (val) => setState(() => _dietaryAlerts = val),
              ),
              const Divider(height: 1),
              _buildSwitchTile(
                theme,
                isDark,
                title: 'Save Scan History',
                icon: LucideIcons.history,
                value: _saveScans,
                onChanged: (val) => setState(() => _saveScans = val),
              ),
            ],
          ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.1),

          const SizedBox(height: AppDimensions.xxxl),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    ThemeData theme,
    bool isDark,
    String title,
    String value,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.md,
        horizontal: AppDimensions.sm,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        border: Border.all(
          color: isDark ? AppColors.surfaceVariantDark : Colors.transparent,
        ),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withAlpha(5),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          const SizedBox(height: AppDimensions.sm),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsGroup(bool isDark, {required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        border: Border.all(
          color: isDark ? AppColors.surfaceVariantDark : Colors.grey.shade200,
        ),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingsListTile(
    ThemeData theme,
    bool isDark, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary.withAlpha(25),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.primary, size: 20),
      ),
      title: Text(title, style: theme.textTheme.bodyLarge),
      subtitle: Text(subtitle, style: theme.textTheme.bodySmall),
      trailing: Icon(
        LucideIcons.chevronRight,
        size: 20,
        color: isDark ? Colors.grey.shade500 : Colors.grey.shade400,
      ),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile(
    ThemeData theme,
    bool isDark, {
    required String title,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey.shade800 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
          size: 20,
        ),
      ),
      title: Text(title, style: theme.textTheme.bodyLarge),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: Colors.white,
        activeTrackColor: AppColors.primary,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: isDark
            ? Colors.grey.shade700
            : Colors.grey.shade300,
      ),
    );
  }
}
