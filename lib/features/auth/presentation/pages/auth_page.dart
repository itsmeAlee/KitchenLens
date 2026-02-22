import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchen_lens/core/theme/app_colors.dart';
import 'package:kitchen_lens/core/theme/app_dimensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLogin = true;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.screenPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Section
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(10),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(
                    LucideIcons.aperture,
                    color: AppColors.primary,
                    size: 36,
                  ),
                ).animate().fadeIn().slideY(begin: -0.2),
                const SizedBox(height: AppDimensions.md),
                Text(
                  'KitchenLens',
                  style: theme.textTheme.displayMedium?.copyWith(
                    color: AppColors.textPrimary,
                    shadows: [
                      Shadow(
                        color: Colors.black.withAlpha(10),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 100.ms).slideY(begin: -0.2),
                const SizedBox(height: AppDimensions.xs),
                Text(
                  'Smart Kitchen AI Assistant',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ).animate().fadeIn(delay: 200.ms).slideY(begin: -0.2),
                const SizedBox(height: AppDimensions.xl),

                // Elevated Card Container
                Container(
                  padding: const EdgeInsets.all(AppDimensions.sm),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
                    border: Border.all(color: AppColors.surfaceBorder),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(10),
                        blurRadius: 32,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Tab Switcher
                      Container(
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.only(bottom: AppDimensions.xl),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundAlt,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusMd,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => _isLogin = true),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: AppDimensions.sm,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _isLogin
                                        ? AppColors.surface
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(
                                      AppDimensions.radiusSm,
                                    ),
                                    boxShadow: _isLogin
                                        ? [
                                            BoxShadow(
                                              color: Colors.black.withAlpha(10),
                                              blurRadius: 4,
                                              offset: const Offset(0, 2),
                                            ),
                                          ]
                                        : [],
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: _isLogin
                                          ? AppColors.primaryDark
                                          : AppColors.textSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => _isLogin = false),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: AppDimensions.sm,
                                  ),
                                  decoration: BoxDecoration(
                                    color: !_isLogin
                                        ? AppColors.surface
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(
                                      AppDimensions.radiusSm,
                                    ),
                                    boxShadow: !_isLogin
                                        ? [
                                            BoxShadow(
                                              color: Colors.black.withAlpha(10),
                                              blurRadius: 4,
                                              offset: const Offset(0, 2),
                                            ),
                                          ]
                                        : [],
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: !_isLogin
                                          ? AppColors.primaryDark
                                          : AppColors.textSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Form Content
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.sm,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (!_isLogin) ...[
                              const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Full Name',
                                  prefixIcon: Icon(LucideIcons.user),
                                ),
                              ).animate().fadeIn().slideY(begin: 0.1),
                              const SizedBox(height: AppDimensions.md),
                            ],
                            const TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Email address',
                                prefixIcon: Icon(LucideIcons.mail),
                              ),
                            ),
                            const SizedBox(height: AppDimensions.md),
                            TextField(
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: const Icon(LucideIcons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? LucideIcons.eyeOff
                                        : LucideIcons.eye,
                                  ),
                                  onPressed: () => setState(
                                    () => _obscurePassword = !_obscurePassword,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: AppDimensions.sm),

                            if (_isLogin)
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    'Forgot Password?',
                                    style: theme.textTheme.labelMedium
                                        ?.copyWith(
                                          color: AppColors.textSecondary,
                                        ),
                                  ),
                                ),
                              ),

                            const SizedBox(height: AppDimensions.lg),
                            FilledButton(
                              onPressed: () {
                                context.go('/home');
                              },
                              child: Text(
                                _isLogin ? 'Welcome Back' : 'Get Started',
                              ),
                            ),
                            const SizedBox(height: AppDimensions.lg),

                            // Divider
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: AppColors.surfaceBorder,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppDimensions.sm,
                                  ),
                                  child: Text(
                                    'Or continue with',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: AppColors.surfaceBorder,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppDimensions.lg),

                            // Social Logins
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildSocialButton(
                                  icon: Image.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/c/c1/Google_%22G%22_logo.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                const SizedBox(width: AppDimensions.md),
                                _buildSocialButton(
                                  icon: const Icon(
                                    Icons.apple,
                                    size: 28,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppDimensions.lg),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1),

                const SizedBox(height: AppDimensions.xl),
                // Terms
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    children: const [
                      TextSpan(text: 'By signing up, you agree to our\n'),
                      TextSpan(
                        text: 'Terms',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      TextSpan(text: ' & '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 400.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({required Widget icon}) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.surface,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.surfaceBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(icon: icon, onPressed: () {}),
    );
  }
}
