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
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Blur
          Positioned.fill(
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuCN6H_3ND6yDxjsUOUc-o4BDo3zVaQpcTQJv60cHg4K28sQCMJzbJOzVmzehuA-C3PgC5I2TcYwlYWP10KRnGtpJybISu0O9khP_hrBgoaX9_1sIdAc0rtefSoZ72xJpX3iZKJ4AiUFzN0HttF_ZY45m7gEe0crA51USd_ZGvj_x0_1OC5lCu3GMTVGBMZb6tzHZneKGVmuArgVY_hd1JnoHqZid_tZ1aCJrkVqPRn18QN6d9VBjP_13O_llOpZdnvhponxndyWOgGu',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: isDark
                    ? Colors.black.withAlpha(100)
                    : Colors.white.withAlpha(75),
              ),
            ),
          ),

          // Main Content Area
          SafeArea(
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
                        color: Colors.white.withAlpha(230),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusMd,
                        ),
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
                        color: isDark ? Colors.white : AppColors.textMainLight,
                        shadows: [
                          Shadow(
                            color: Colors.black.withAlpha(50),
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
                        color: isDark
                            ? Colors.white70
                            : AppColors.textSecondaryLight,
                      ),
                    ).animate().fadeIn(delay: 200.ms).slideY(begin: -0.2),
                    const SizedBox(height: AppDimensions.xl),

                    // Glass Card Container
                    Container(
                      padding: const EdgeInsets.all(AppDimensions.sm),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.glassDark
                            : AppColors.glassLight,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusLg,
                        ),
                        border: Border.all(
                          color: isDark
                              ? AppColors.glassBorderDark
                              : AppColors.glassBorderLight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(20),
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
                            margin: const EdgeInsets.only(
                              bottom: AppDimensions.xl,
                            ),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? Colors.grey.shade800.withAlpha(150)
                                  : Colors.grey.shade100.withAlpha(150),
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusMd,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () =>
                                        setState(() => _isLogin = true),
                                    child: AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: AppDimensions.sm,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _isLogin
                                            ? (isDark
                                                  ? Colors.grey.shade700
                                                  : Colors.white)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                          AppDimensions.radiusSm,
                                        ),
                                        boxShadow: _isLogin
                                            ? [
                                                BoxShadow(
                                                  color: Colors.black.withAlpha(
                                                    10,
                                                  ),
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
                                              ? (isDark
                                                    ? Colors.white
                                                    : AppColors.textMainLight)
                                              : (isDark
                                                    ? Colors.grey.shade400
                                                    : AppColors
                                                          .textSecondaryLight),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () =>
                                        setState(() => _isLogin = false),
                                    child: AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: AppDimensions.sm,
                                      ),
                                      decoration: BoxDecoration(
                                        color: !_isLogin
                                            ? (isDark
                                                  ? Colors.grey.shade700
                                                  : Colors.white)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                          AppDimensions.radiusSm,
                                        ),
                                        boxShadow: !_isLogin
                                            ? [
                                                BoxShadow(
                                                  color: Colors.black.withAlpha(
                                                    10,
                                                  ),
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
                                              ? (isDark
                                                    ? Colors.white
                                                    : AppColors.textMainLight)
                                              : (isDark
                                                    ? Colors.grey.shade400
                                                    : AppColors
                                                          .textSecondaryLight),
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
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Full Name',
                                      prefixIcon: const Icon(LucideIcons.user),
                                      fillColor: isDark
                                          ? Colors.black.withAlpha(150)
                                          : Colors.white.withAlpha(200),
                                    ),
                                  ).animate().fadeIn().slideY(begin: 0.1),
                                  const SizedBox(height: AppDimensions.md),
                                ],
                                TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: 'Email address',
                                    prefixIcon: const Icon(LucideIcons.mail),
                                    fillColor: isDark
                                        ? Colors.black.withAlpha(150)
                                        : Colors.white.withAlpha(200),
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
                                        () => _obscurePassword =
                                            !_obscurePassword,
                                      ),
                                    ),
                                    fillColor: isDark
                                        ? Colors.black.withAlpha(150)
                                        : Colors.white.withAlpha(200),
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
                                              color: isDark
                                                  ? Colors.grey.shade300
                                                  : AppColors
                                                        .textSecondaryLight,
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
                                        color: isDark
                                            ? Colors.grey.shade700
                                            : Colors.grey.shade300,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: AppDimensions.sm,
                                      ),
                                      child: Text(
                                        'Or continue with',
                                        style: theme.textTheme.labelSmall
                                            ?.copyWith(
                                              color: isDark
                                                  ? Colors.grey.shade400
                                                  : AppColors
                                                        .textSecondaryLight,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        color: isDark
                                            ? Colors.grey.shade700
                                            : Colors.grey.shade300,
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
                                      isDark: isDark,
                                    ),
                                    const SizedBox(width: AppDimensions.md),
                                    _buildSocialButton(
                                      icon: Icon(
                                        Icons.apple,
                                        size: 28,
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ), // Apple logo close enough
                                      isDark: isDark,
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
                          color: isDark
                              ? Colors.white70
                              : AppColors.textMainLight,
                        ),
                        children: [
                          const TextSpan(
                            text: 'By signing up, you agree to our\n',
                          ),
                          TextSpan(
                            text: 'Terms',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: isDark
                                  ? Colors.white
                                  : AppColors.textMainLight,
                            ),
                          ),
                          const TextSpan(text: ' & '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: isDark
                                  ? Colors.white
                                  : AppColors.textMainLight,
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
        ],
      ),
    );
  }

  Widget _buildSocialButton({required Widget icon, required bool isDark}) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: isDark ? Colors.grey.shade700 : Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(icon: icon, onPressed: () {}),
    );
  }
}
