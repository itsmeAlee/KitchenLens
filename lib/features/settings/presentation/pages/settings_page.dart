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

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.screenPadding,
          vertical: AppDimensions.md,
        ),
        children: [
          // Preferences Segment
          Text(
            'PREFERENCES',
            style: theme.textTheme.labelSmall?.copyWith(letterSpacing: 1.2),
          ).animate().fadeIn(delay: 100.ms),
          const SizedBox(height: AppDimensions.sm),
          _buildSettingsGroup(
            children: [
              _buildSettingsListTile(
                theme,
                title: 'Dietary Profile',
                subtitle: 'Vegetarian, Nut Allergy',
                icon: LucideIcons.apple,
                onTap: () {},
              ),
              const Divider(height: 1),
              _buildSettingsListTile(
                theme,
                title: 'Theme',
                subtitle: 'Light',
                icon: LucideIcons.moon,
                onTap: () {},
              ),
            ],
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),

          const SizedBox(height: AppDimensions.xl),
          // App Settings Segment
          Text(
            'APP SETTINGS',
            style: theme.textTheme.labelSmall?.copyWith(letterSpacing: 1.2),
          ).animate().fadeIn(delay: 300.ms),
          const SizedBox(height: AppDimensions.sm),
          _buildSettingsGroup(
            children: [
              _buildSwitchTile(
                theme,
                title: 'Push Notifications',
                icon: LucideIcons.bell,
                value: _pushNotifications,
                onChanged: (val) => setState(() => _pushNotifications = val),
              ),
              const Divider(height: 1),
              _buildSwitchTile(
                theme,
                title: 'Dietary Warning Alerts',
                icon: Icons.warning_amber_rounded,
                value: _dietaryAlerts,
                onChanged: (val) => setState(() => _dietaryAlerts = val),
              ),
              const Divider(height: 1),
              _buildSwitchTile(
                theme,
                title: 'Save Scan History',
                icon: LucideIcons.history,
                value: _saveScans,
                onChanged: (val) => setState(() => _saveScans = val),
              ),
            ],
          ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1),

          const SizedBox(height: AppDimensions.xxxl),
        ],
      ),
    );
  }

  Widget _buildSettingsGroup({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingsListTile(
    ThemeData theme, {
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
        color: Colors.grey.shade400,
      ),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile(
    ThemeData theme, {
    required String title,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.grey.shade600, size: 20),
      ),
      title: Text(title, style: theme.textTheme.bodyLarge),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: Colors.white,
        activeTrackColor: AppColors.primary,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade300,
      ),
    );
  }
}
