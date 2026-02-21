import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IngredientsReviewPage extends ConsumerWidget {
  const IngredientsReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Exact colors from HTML
    final bgColor = isDark ? const Color(0xFF112116) : const Color(0xFFF6F8F6);
    final surfaceColor = isDark
        ? const Color(0xFF1E2E24)
        : const Color(0xFFFFFFFF);
    final primaryColor = const Color(0xFF19E65E);
    final primaryDarkColor = const Color(0xFF15C24E);
    final textColor = isDark
        ? const Color(0xFFF1F5F9)
        : const Color(0xFF0F172A);
    final textMutedColor = isDark
        ? const Color(0xFF94A3B8)
        : const Color(0xFF64748B);
    final borderColor = isDark
        ? const Color(0xFF1E293B)
        : const Color(0xFFF1F5F9);

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildIconButton(
                        icon: Icons.arrow_back,
                        surfaceColor: surfaceColor,
                        borderColor: borderColor,
                        iconColor: textColor,
                        onTap: () {
                          if (context.canPop()) {
                            context.pop();
                          } else {
                            context.go('/home');
                          }
                        },
                      ),
                      Text(
                        'Scan Results',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      _buildIconButton(
                        icon: Icons.more_horiz,
                        surfaceColor: surfaceColor,
                        borderColor: borderColor,
                        iconColor: textColor,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),

                // Main Content
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(
                      bottom: 100,
                    ), // Space for bottom nav
                    children: [
                      // Found Ingredients Title
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                size: 18,
                                color: primaryDarkColor,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Found 5 Ingredients',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Horizontal Ingredients List
                      SizedBox(
                        height: 100,
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildIngredientItem(
                              '🐟',
                              'Salmon',
                              const Color(0xFFFFF7ED),
                              const Color(0xFF7C2D12),
                              const Color(0xFFFFEDD5),
                              isDark,
                            ),
                            const SizedBox(width: 12),
                            _buildIngredientItem(
                              '🥦',
                              'Broccoli',
                              const Color(0xFFF0FDF4),
                              const Color(0xFF14532D),
                              const Color(0xFFDCFCE7),
                              isDark,
                            ),
                            const SizedBox(width: 12),
                            _buildIngredientItem(
                              '🍋',
                              'Lemon',
                              const Color(0xFFFEFCE8),
                              const Color(0xFF713F12),
                              const Color(0xFFFEF08A),
                              isDark,
                            ),
                            const SizedBox(width: 12),
                            _buildIngredientItem(
                              '🧄',
                              'Garlic',
                              const Color(0xFFFEF2F2),
                              const Color(0xFF7F1D1D),
                              const Color(0xFFFEE2E2),
                              isDark,
                            ),
                            const SizedBox(width: 12),
                            _buildIngredientItem(
                              '🧈',
                              'Butter',
                              const Color(0xFFF8FAFC),
                              const Color(0xFF0F172A),
                              const Color(0xFFE2E8F0),
                              isDark,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Top Match
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Top Match',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  ),
                                  Text(
                                    'Based on ingredients',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Top Match Card
                            AspectRatio(
                              aspectRatio: 4 / 5,
                              child: Stack(
                                children: [
                                  // Background Image
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                          'https://lh3.googleusercontent.com/aida-public/AB6AXuCN6H_3ND6yDxjsUOUc-o4BDo3zVaQpcTQJv60cHg4K28sQCMJzbJOzVmzehuA-C3PgC5I2TcYwlYWP10KRnGtpJybISu0O9khP_hrBgoaX9_1sIdAc0rtefSoZ72xJpX3iZKJ4AiUFzN0HttF_ZY45m7gEe0crA51USd_ZGvj_x0_1OC5lCu3GMTVGBMZb6tzHZneKGVmuArgVY_hd1JnoHqZid_tZ1aCJrkVqPRn18QN6d9VBjP_13O_llOpZdnvhponxndyWOgGu',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  // Gradient Overlay
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.8),
                                          Colors.black.withOpacity(0.1),
                                          Colors.transparent,
                                        ],
                                        stops: const [0.0, 0.4, 1.0],
                                      ),
                                    ),
                                  ),

                                  // Top Badges
                                  Positioned(
                                    top: 24,
                                    left: 24,
                                    right: 24,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        _buildGlassBadge(
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 8,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              const SizedBox(width: 6),
                                              const Text(
                                                '98% Match',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 8,
                                          ),
                                        ),
                                        _buildGlassBadge(
                                          child: const Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          padding: const EdgeInsets.all(10),
                                          isCircle: true,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Bottom Info Panel
                                  Positioned(
                                    bottom: 24,
                                    left: 24,
                                    right: 24,
                                    child: _buildGlassPanel(
                                      isDark: isDark,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Lemon Butter Pan-Seared Salmon',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: textColor,
                                              height: 1.1,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Row(
                                            children: [
                                              _buildMetaIcon(
                                                Icons.schedule,
                                                '25 min',
                                                textMutedColor,
                                              ),
                                              const SizedBox(width: 8),
                                              _buildDot(textMutedColor),
                                              const SizedBox(width: 8),
                                              _buildMetaIcon(
                                                Icons.bar_chart,
                                                'Easy',
                                                textMutedColor,
                                              ),
                                              const SizedBox(width: 8),
                                              _buildDot(textMutedColor),
                                              const SizedBox(width: 8),
                                              _buildMetaIcon(
                                                Icons
                                                    .local_fire_department_outlined,
                                                '450 kcal',
                                                textMutedColor,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          GestureDetector(
                                            onTap: () =>
                                                context.push('/recipe/1'),
                                            child: Container(
                                              width: double.infinity,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 14,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: primaryColor
                                                        .withOpacity(0.3),
                                                    blurRadius: 12,
                                                    offset: const Offset(0, 4),
                                                  ),
                                                ],
                                              ),
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.restaurant,
                                                    color: Colors.black,
                                                    size: 22,
                                                  ),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    'Cook This',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
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
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Other Suggestions
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Other Suggestions',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),
                                Text(
                                  'View All',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: textMutedColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildSuggestionCard(
                                    'Lemon Butter Pasta',
                                    '15 min • Intermediate',
                                    '85% Match',
                                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDDKDKW9KBpXgAeoDm2wd9cAz16G6YXiO5oGw_2j74f-dRZFowUsbsVpupBaffUV5cIT_oKJNbXtDsrjtlFialhLgeV7WQqGtvPEHcq_9H-3_i-QMCODCaPybyxivOVw3Uoy8eX9G2ya09C7WaZfWEwv13cDiNynx8ab-lik2kruk9FNHBG9pu5yXsITskj3HfEGnMFEWZPekbvdgyj5hHnbcGE3oxGMK4S57Yx19bu2g0xVOFzp-0eIsYYaP7I0eL_SWzP_0c94To1',
                                    surfaceColor,
                                    textColor,
                                    textMutedColor,
                                    onTap: () => context.push('/recipe/2'),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildSuggestionCard(
                                    'Pan-Seared Veggies',
                                    '20 min • Easy',
                                    '72% Match',
                                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDUw-h7mB6Z2GyEJEcme-BEmYU7mtfb4mNF98fYpXGTaur22GI31vwTbZHrxbMxwrx-I5tJAnZEycKsG9smo183xHFld8_DVvwffkRPMsbHYMDdC5Eugmrrng6JIAwwz6hQpoh9cWtMquSDFc6Jf4nb5IEN6GdFI2tc7A3a3yL-J2ovW-wOyMvKKJzehhBuHsyKo2r1SKJ4-9dj3rxg-dl_zWcC60PKtNiAPh0Ct7vj1XWRbUrcJGzObjM43XgYiOShZVDXfFBEEyIk',
                                    surfaceColor,
                                    textColor,
                                    textMutedColor,
                                    onTap: () => context.push('/recipe/3'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Custom Bottom Navigation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 24,
                    top: 12,
                    left: 24,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                    color: surfaceColor.withOpacity(0.9),
                    border: Border(top: BorderSide(color: borderColor)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavItem(
                        Icons.home,
                        'Home',
                        false,
                        textMutedColor,
                        primaryColor,
                        onTap: () => context.go('/home'),
                      ),
                      _buildNavItem(
                        Icons.qr_code_scanner,
                        'Scan',
                        true,
                        textMutedColor,
                        primaryColor,
                        onTap: () => context.go('/capture'),
                      ),
                      _buildNavItem(
                        Icons.favorite,
                        'Saved',
                        false,
                        textMutedColor,
                        primaryColor,
                      ),
                      _buildNavItem(
                        Icons.person,
                        'Profile',
                        false,
                        textMutedColor,
                        primaryColor,
                        onTap: () => context.push('/settings'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required Color surfaceColor,
    required Color borderColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: surfaceColor,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
    );
  }

  Widget _buildIngredientItem(
    String emoji,
    String name,
    Color lightBg,
    Color darkBg,
    Color border,
    bool isDark,
  ) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: isDark ? darkBg.withOpacity(0.2) : lightBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? darkBg.withOpacity(0.5) : border,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(emoji, style: const TextStyle(fontSize: 28)),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildGlassBadge({
    required Widget child,
    required EdgeInsets padding,
    bool isCircle = false,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(isCircle ? 999 : 24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(isCircle ? 999 : 24),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _buildGlassPanel({required Widget child, required bool isDark}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xFF1E2E24).withOpacity(0.7)
                : Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withOpacity(isDark ? 0.1 : 0.3),
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _buildMetaIcon(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 4,
      height: 4,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _buildSuggestionCard(
    String title,
    String subtitle,
    String matchPercentage,
    String imageUrl,
    Color surfaceColor,
    Color textColor,
    Color mutedColor, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: _buildGlassBadge(
                    child: Text(
                      matchPercentage,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: mutedColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    bool isActive,
    Color mutedColor,
    Color primaryColor, {
    VoidCallback? onTap,
  }) {
    final color = isActive ? primaryColor : mutedColor;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isActive)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: primaryColor, size: 24),
            )
          else
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: Icon(icon, color: color, size: 24),
            ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              color: color,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
