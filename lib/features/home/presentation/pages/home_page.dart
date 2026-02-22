import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchen_lens/core/mock/mock_data.dart';
import 'package:kitchen_lens/core/theme/app_colors.dart';
import 'package:kitchen_lens/core/theme/app_dimensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.screenPadding,
                vertical: AppDimensions.md,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          image: const DecorationImage(
                            image: CachedNetworkImageProvider(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuDDKDKW9KBpXgAeoDm2wd9cAz16G6YXiO5oGw_2j74f-dRZFowUsbsVpupBaffUV5cIT_oKJNbXtDsrjtlFialhLgeV7WQqGtvPEHcq_9H-3_i-QMCODCaPybyxivOVw3Uoy8eX9G2ya09C7WaZfWEwv13cDiNynx8ab-lik2kruk9FNHBG9pu5yXsITskj3HfEGnMFEWZPekbvdgyj5hHnbcGE3oxGMK4S57Yx19bu2g0xVOFzp-0eIsYYaP7I0eL_SWzP_0c94To1',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppDimensions.sm),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Afternoon,',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text(
                            'Chef Alex',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(10),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(LucideIcons.bell),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: AppDimensions.xxl),
                children: [
                  // Hero Scanning Area
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.screenPadding,
                    ),
                    child: Container(
                      height: 420,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(20),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://lh3.googleusercontent.com/aida-public/AB6AXuCN6H_3ND6yDxjsUOUc-o4BDo3zVaQpcTQJv60cHg4K28sQCMJzbJOzVmzehuA-C3PgC5I2TcYwlYWP10KRnGtpJybISu0O9khP_hrBgoaX9_1sIdAc0rtefSoZ72xJpX3iZKJ4AiUFzN0HttF_ZY45m7gEe0crA51USd_ZGvj_x0_1OC5lCu3GMTVGBMZb6tzHZneKGVmuArgVY_hd1JnoHqZid_tZ1aCJrkVqPRn18QN6d9VBjP_13O_llOpZdnvhponxndyWOgGu',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withAlpha(25),
                                      Colors.black.withAlpha(180),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: AppDimensions.xl,
                              left: AppDimensions.lg,
                              right: AppDimensions.lg,
                              child: Column(
                                children: [
                                  Text(
                                    'KitchenLens AI',
                                    style: theme.textTheme.displaySmall
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: AppDimensions.xs),
                                  Text(
                                    'Ready to cook? Scan your ingredients.',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: Colors.white.withAlpha(230),
                                    ),
                                  ),
                                  const SizedBox(height: AppDimensions.lg),
                                  GestureDetector(
                                    onTap: () {
                                      context.go('/capture');
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        AppDimensions.radiusMax,
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: AppDimensions.md,
                                          horizontal: AppDimensions.lg,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white, // solid opaque
                                          borderRadius: BorderRadius.circular(
                                            AppDimensions.radiusMax,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withAlpha(20),
                                              blurRadius: 10,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                color: AppColors.primary,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                LucideIcons.scanLine,
                                                color: AppColors.textOnPrimary,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: AppDimensions.md,
                                            ),
                                            const Text(
                                              'Start Scanning',
                                              style: TextStyle(
                                                color: AppColors.textPrimary,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
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
                          ],
                        ),
                      ),
                    ),
                  ).animate().fadeIn().scale(begin: const Offset(0.95, 0.95)),

                  const SizedBox(height: AppDimensions.xl),

                  // Recent Discoveries Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.screenPadding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Discoveries',
                          style: theme.textTheme.titleLarge,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withAlpha(51),
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusMax,
                            ),
                          ),
                          child: const Text(
                            '98% Match',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 300.ms),
                  const SizedBox(height: AppDimensions.md),

                  // Recent Discoveries List (Horizontal)
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.screenPadding,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: MockData.recipes.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: AppDimensions.md),
                      itemBuilder: (context, index) {
                        final recipe = MockData.recipes[index];
                        return _buildRecipeCard(theme, recipe);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildRecipeCard(ThemeData theme, Map<String, dynamic> recipe) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Box
          SizedBox(
            height: 160,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(32),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: recipe['imageUrl'],
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: AppDimensions.sm,
                    right: AppDimensions.sm,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusMax,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(10),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            LucideIcons.clock,
                            size: 14,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            recipe['time'],
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
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
          // Content
          Padding(
            padding: const EdgeInsets.all(AppDimensions.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe['title'],
                  style: theme.textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${recipe['ingredients']?.length ?? 5} ingredients matched',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: AppDimensions.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 12,
                          backgroundImage: CachedNetworkImageProvider(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuDUw-h7mB6Z2GyEJEcme-BEmYU7mtfb4mNF98fYpXGTaur22GI31vwTbZHrxbMxwrx-I5tJAnZEycKsG9smo183xHFld8_DVvwffkRPMsbHYMDdC5Eugmrrng6JIAwwz6hQpoh9cWtMquSDFc6Jf4nb5IEN6GdFI2tc7A3a3yL-J2ovW-wOyMvKKJzehhBuHsyKo2r1SKJ4-9dj3rxg-dl_zWcC60PKtNiAPh0Ct7vj1XWRbUrcJGzObjM43XgYiOShZVDXfFBEEyIk',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceVariant,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusMax,
                            ),
                          ),
                          child: Text(
                            'By Chef Sarah',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          LucideIcons.arrowRight,
                          size: 20,
                          color: AppColors.textOnPrimary,
                        ),
                        onPressed: () {
                          // mock navigation to recipe details
                          context.push('/recipe_detail');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.surfaceBorder)),
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == _currentIndex) return;
          switch (index) {
            case 0:
              // Already on Home
              break;
            case 1:
              context.push('/capture');
              return;
            case 2:
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Saved recipes coming soon!'),
                  duration: Duration(seconds: 1),
                ),
              );
              return;
            case 3:
              context.push('/profile');
              return;
          }
          setState(() => _currentIndex = index);
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textMuted,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 10,
        ),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.scan), label: 'Scan'),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
