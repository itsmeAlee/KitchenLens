import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchen_lens/core/theme/app_colors.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ScanResultPage extends StatefulWidget {
  const ScanResultPage({super.key});

  @override
  State<ScanResultPage> createState() => _ScanResultPageState();
}

class _ScanResultPageState extends State<ScanResultPage> {
  final List<Map<String, dynamic>> _ingredients = [
    {
      'name': 'Salmon',
      'emoji': '🐟',
      'bg': const Color(0xFFFFF7ED),
      'border': const Color(0xFFFFEDD5),
    },
    {
      'name': 'Broccoli',
      'emoji': '🥦',
      'bg': const Color(0xFFF0FDF4),
      'border': const Color(0xFFDCFCE7),
    },
    {
      'name': 'Lemon',
      'emoji': '🍋',
      'bg': const Color(0xFFFEFCE8),
      'border': const Color(0xFFFEF08A),
    },
    {
      'name': 'Garlic',
      'emoji': '🧄',
      'bg': const Color(0xFFFEF2F2),
      'border': const Color(0xFFFEE2E2),
    },
    {
      'name': 'Butter',
      'emoji': '🧈',
      'bg': const Color(0xFFF8FAFC),
      'border': const Color(0xFFE2E8F0),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconButton(Icons.arrow_back, () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/home');
                    }
                  }),
                  const Text(
                    'Scan Results',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  _buildIconButton(Icons.more_horiz, () {}),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 96),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Ingredients Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFDCFCE7),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    size: 18,
                                    color: Color(0xFF16A34A),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Found ${_ingredients.length} Ingredients',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ).animate().fadeIn().slideY(begin: 0.1),

                      const SizedBox(height: 16),

                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: _ingredients.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 12),
                          itemBuilder: (context, index) {
                            final ing = _ingredients[index];
                            return Column(
                                  children: [
                                    Container(
                                      height: 64,
                                      width: 64,
                                      decoration: BoxDecoration(
                                        color: ing['bg'] as Color,
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: ing['border'] as Color,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withAlpha(10),
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        ing['emoji'] as String,
                                        style: const TextStyle(fontSize: 30),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      ing['name'] as String,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                )
                                .animate()
                                .fadeIn(
                                  delay: Duration(
                                    milliseconds: 100 + (index * 50),
                                  ),
                                )
                                .scale(begin: const Offset(0.9, 0.9));
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Top Match Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 16,
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
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(25),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: AspectRatio(
                                aspectRatio: 4 / 5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl:
                                            'https://lh3.googleusercontent.com/aida-public/AB6AXuCN6H_3ND6yDxjsUOUc-o4BDo3zVaQpcTQJv60cHg4K28sQCMJzbJOzVmzehuA-C3PgC5I2TcYwlYWP10KRnGtpJybISu0O9khP_hrBgoaX9_1sIdAc0rtefSoZ72xJpX3iZKJ4AiUFzN0HttF_ZY45m7gEe0crA51USd_ZGvj_x0_1OC5lCu3GMTVGBMZb6tzHZneKGVmuArgVY_hd1JnoHqZid_tZ1aCJrkVqPRn18QN6d9VBjP_13O_llOpZdnvhponxndyWOgGu',
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              Colors.black.withAlpha(200),
                                              Colors.transparent,
                                              Colors.black.withAlpha(25),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 24,
                                        left: 24,
                                        right: 24,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _buildBadge(
                                              child: Row(
                                                children: [
                                                  Container(
                                                        width: 8,
                                                        height: 8,
                                                        decoration:
                                                            const BoxDecoration(
                                                              color: AppColors
                                                                  .primary,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                      )
                                                      .animate(
                                                        onPlay: (controller) =>
                                                            controller.repeat(),
                                                      )
                                                      .fadeIn(duration: 500.ms)
                                                      .fadeOut(
                                                        duration: 500.ms,
                                                        delay: 500.ms,
                                                      ),
                                                  const SizedBox(width: 6),
                                                  const Text(
                                                    '98% Match',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          AppColors.textPrimary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            _buildPanelIconButton(
                                              Icons.favorite,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(24),
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
                                                    height: 1.1,
                                                    color:
                                                        AppColors.textPrimary,
                                                  ),
                                                ),
                                                const SizedBox(height: 16),
                                                Row(
                                                  children: [
                                                    _buildStatItem(
                                                      Icons.schedule,
                                                      '25 min',
                                                    ),
                                                    _buildDot(),
                                                    _buildStatItem(
                                                      Icons.bar_chart,
                                                      'Easy',
                                                    ),
                                                    _buildDot(),
                                                    _buildStatItem(
                                                      Icons
                                                          .local_fire_department,
                                                      '450 kcal',
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 20),
                                                SizedBox(
                                                  width: double.infinity,
                                                  height: 56,
                                                  child: ElevatedButton.icon(
                                                    onPressed: () => context
                                                        .push('/recipe_detail'),
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          AppColors.primary,
                                                      foregroundColor:
                                                          const Color(
                                                            0xFF0F172A,
                                                          ),
                                                      elevation: 10,
                                                      shadowColor: AppColors
                                                          .primary
                                                          .withAlpha(100),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              16,
                                                            ),
                                                      ),
                                                    ),
                                                    icon: const Icon(
                                                      Icons.cookie,
                                                      size: 24,
                                                    ), // Fallback for skillet
                                                    label: const Text(
                                                      'Cook This',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),

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
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'View All',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: _buildSuggestionCard(
                                    'Lemon Butter Pasta',
                                    '15 min • Intermediate',
                                    '85% Match',
                                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDDKDKW9KBpXgAeoDm2wd9cAz16G6YXiO5oGw_2j74f-dRZFowUsbsVpupBaffUV5cIT_oKJNbXtDsrjtlFialhLgeV7WQqGtvPEHcq_9H-3_i-QMCODCaPybyxivOVw3Uoy8eX9G2ya09C7WaZfWEwv13cDiNynx8ab-lik2kruk9FNHBG9pu5yXsITskj3HfEGnMFEWZPekbvdgyj5hHnbcGE3oxGMK4S57Yx19bu2g0xVOFzp-0eIsYYaP7I0eL_SWzP_0c94To1',
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildSuggestionCard(
                                    'Pan-Seared Veggies',
                                    '20 min • Easy',
                                    '72% Match',
                                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDUw-h7mB6Z2GyEJEcme-BEmYU7mtfb4mNF98fYpXGTaur22GI31vwTbZHrxbMxwrx-I5tJAnZEycKsG9smo183xHFld8_DVvwffkRPMsbHYMDdC5Eugmrrng6JIAwwz6hQpoh9cWtMquSDFc6Jf4nb5IEN6GdFI2tc7A3a3yL-J2ovW-wOyMvKKJzehhBuHsyKo2r1SKJ4-9dj3rxg-dl_zWcC60PKtNiAPh0Ct7vj1XWRbUrcJGzObjM43XgYiOShZVDXfFBEEyIk',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
      extendBody: true,
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return Container(
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
      child: IconButton(
        icon: Icon(icon, size: 20, color: AppColors.textPrimary),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildBadge({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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

  Widget _buildStatItem(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textSecondary),
        const SizedBox(width: 4),
        Text(
          label,
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
      margin: const EdgeInsets.symmetric(horizontal: 8),
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
    String match,
    String imageUrl,
  ) {
    return GestureDetector(
      onTap: () => context.push('/recipe_detail'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: _buildBadge(
                        child: Text(
                          match,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 1.25,
              color: AppColors.textPrimary,
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
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.surfaceBorder)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                Icons.home,
                'Home',
                false,
                () => context.go('/home'),
              ),
              _buildNavItem(Icons.qr_code_scanner, 'Scan', true, () {}),
              _buildNavItem(Icons.favorite, 'Saved', false, () {}),
              _buildNavItem(Icons.person, 'Profile', false, () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    bool isActive,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: isActive
                ? BoxDecoration(
                    color: AppColors.primary.withAlpha(50),
                    shape: BoxShape.circle,
                  )
                : null,
            child: Icon(
              icon,
              size: 24,
              color: isActive ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              letterSpacing: 0.5,
              color: isActive ? AppColors.textPrimary : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
