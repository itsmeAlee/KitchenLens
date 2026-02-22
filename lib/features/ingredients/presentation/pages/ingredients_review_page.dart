import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen_lens/core/theme/app_colors.dart';

class IngredientsReviewPage extends ConsumerWidget {
  const IngredientsReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
                        onTap: () {
                          if (context.canPop()) {
                            context.pop();
                          } else {
                            context.go('/home');
                          }
                        },
                      ),
                      const Text(
                        'Scan Results',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      _buildIconButton(icon: Icons.more_horiz, onTap: () {}),
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
                                color: AppColors.primary.withAlpha(51),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                size: 18,
                                color: AppColors.primaryDark,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Found 5 Ingredients',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
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
                              const Color(0xFFFFEDD5),
                            ),
                            const SizedBox(width: 12),
                            _buildIngredientItem(
                              '🥦',
                              'Broccoli',
                              const Color(0xFFF0FDF4),
                              const Color(0xFFDCFCE7),
                            ),
                            const SizedBox(width: 12),
                            _buildIngredientItem(
                              '🍋',
                              'Lemon',
                              const Color(0xFFFEFCE8),
                              const Color(0xFFFEF08A),
                            ),
                            const SizedBox(width: 12),
                            _buildIngredientItem(
                              '🧄',
                              'Garlic',
                              const Color(0xFFFEF2F2),
                              const Color(0xFFFEE2E2),
                            ),
                            const SizedBox(width: 12),
                            _buildIngredientItem(
                              '🧈',
                              'Butter',
                              const Color(0xFFF8FAFC),
                              const Color(0xFFE2E8F0),
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
                                  const Text(
                                    'Top Match',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const Text(
                                    'Based on ingredients',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary,
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
                                          Colors.black.withAlpha(204),
                                          Colors.black.withAlpha(25),
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
                                        _buildBadge(
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 8,
                                                height: 8,
                                                decoration: const BoxDecoration(
                                                  color: AppColors.primary,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              const SizedBox(width: 6),
                                              const Text(
                                                '98% Match',
                                                style: TextStyle(
                                                  color: AppColors.textPrimary,
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
                                        _buildPanelIconButton(Icons.favorite),
                                      ],
                                    ),
                                  ),

                                  // Bottom Info Panel
                                  Positioned(
                                    bottom: 24,
                                    left: 24,
                                    right: 24,
                                    child: _buildPanel(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Lemon Butter Pan-Seared Salmon',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.textPrimary,
                                              height: 1.1,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Row(
                                            children: [
                                              _buildMetaIcon(
                                                Icons.schedule,
                                                '25 min',
                                              ),
                                              const SizedBox(width: 8),
                                              _buildDot(),
                                              const SizedBox(width: 8),
                                              _buildMetaIcon(
                                                Icons.bar_chart,
                                                'Easy',
                                              ),
                                              const SizedBox(width: 8),
                                              _buildDot(),
                                              const SizedBox(width: 8),
                                              _buildMetaIcon(
                                                Icons
                                                    .local_fire_department_outlined,
                                                '450 kcal',
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
                                                color: AppColors.primary,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.primary
                                                        .withAlpha(76),
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
                                                    color:
                                                        AppColors.textOnPrimary,
                                                    size: 22,
                                                  ),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    'Cook This',
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .textOnPrimary,
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
                                const Text(
                                  'Other Suggestions',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const Text(
                                  'View All',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textSecondary,
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
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 24,
                top: 12,
                left: 24,
                right: 24,
              ),
              decoration: const BoxDecoration(
                color: AppColors.surface,
                border: Border(top: BorderSide(color: AppColors.surfaceBorder)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    Icons.home,
                    'Home',
                    false,
                    onTap: () => context.go('/home'),
                  ),
                  _buildNavItem(
                    Icons.qr_code_scanner,
                    'Scan',
                    true,
                    onTap: () => context.go('/capture'),
                  ),
                  _buildNavItem(Icons.favorite, 'Saved', false),
                  _buildNavItem(
                    Icons.person,
                    'Profile',
                    false,
                    onTap: () => context.push('/settings'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.surfaceBorder),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Icon(icon, color: AppColors.textPrimary, size: 20),
      ),
    );
  }

  Widget _buildIngredientItem(
    String emoji,
    String name,
    Color bg,
    Color border,
  ) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(5),
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
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildBadge({
    required Widget child,
    required EdgeInsets padding,
    bool isCircle = false,
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(isCircle ? 999 : 24),
        border: Border.all(color: AppColors.surfaceBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildPanelIconButton(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(color: AppColors.surfaceBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, size: 20, color: AppColors.textSecondary),
        onPressed: () {},
      ),
    );
  }

  Widget _buildPanel({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.surfaceBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildMetaIcon(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textSecondary),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildDot() {
    return Container(
      width: 4,
      height: 4,
      decoration: const BoxDecoration(
        color: AppColors.textMuted,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildSuggestionCard(
    String title,
    String subtitle,
    String matchPercentage,
    String imageUrl, {
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
                    color: AppColors.surfaceVariant,
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(10),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: _buildBadge(
                    child: Text(
                      matchPercentage,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
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
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    bool isActive, {
    VoidCallback? onTap,
  }) {
    final color = isActive ? AppColors.primary : AppColors.textSecondary;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isActive)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(51),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primary, size: 24),
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
              color: isActive ? AppColors.textPrimary : AppColors.textSecondary,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
