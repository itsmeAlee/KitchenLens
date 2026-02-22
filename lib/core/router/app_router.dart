import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Import feature pages
import 'package:kitchen_lens/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:kitchen_lens/features/auth/presentation/pages/auth_page.dart';
import 'package:kitchen_lens/features/home/presentation/pages/home_page.dart';
import 'package:kitchen_lens/features/capture/presentation/pages/capture_page.dart';
import 'package:kitchen_lens/features/scan/presentation/pages/processing_page.dart';
import 'package:kitchen_lens/features/scan_result/presentation/pages/scan_result_page.dart';
import 'package:kitchen_lens/features/recipes/presentation/pages/recipe_detail_page.dart';
import 'package:kitchen_lens/features/cook_mode/presentation/pages/cook_mode_page.dart';
import 'package:kitchen_lens/features/settings/presentation/pages/settings_page.dart';
import 'package:kitchen_lens/features/profile/presentation/pages/profile_page.dart';

/// Custom slide-up transition used for most routes.
CustomTransitionPage<void> _buildTransitionPage({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curve = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      );
      return FadeTransition(
        opacity: curve,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.06),
            end: Offset.zero,
          ).animate(curve),
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 350),
  );
}

final appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/auth',
      pageBuilder: (context, state) =>
          _buildTransitionPage(key: state.pageKey, child: const AuthPage()),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) =>
          _buildTransitionPage(key: state.pageKey, child: const HomePage()),
    ),
    GoRoute(
      path: '/capture',
      pageBuilder: (context, state) =>
          _buildTransitionPage(key: state.pageKey, child: const CapturePage()),
    ),
    GoRoute(
      path: '/upload',
      pageBuilder: (context, state) => _buildTransitionPage(
        key: state.pageKey,
        child: const ProcessingPage(),
      ),
    ),
    GoRoute(
      path: '/scan_result',
      pageBuilder: (context, state) => _buildTransitionPage(
        key: state.pageKey,
        child: const ScanResultPage(),
      ),
    ),
    GoRoute(
      path: '/recipe_detail',
      pageBuilder: (context, state) => _buildTransitionPage(
        key: state.pageKey,
        child: const RecipeDetailPage(),
      ),
    ),
    GoRoute(
      path: '/cook_mode',
      pageBuilder: (context, state) =>
          _buildTransitionPage(key: state.pageKey, child: const CookModePage()),
    ),
    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) =>
          _buildTransitionPage(key: state.pageKey, child: const ProfilePage()),
    ),
    GoRoute(
      path: '/profile/settings',
      pageBuilder: (context, state) =>
          _buildTransitionPage(key: state.pageKey, child: const SettingsPage()),
    ),
  ],
);
