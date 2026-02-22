import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchen_lens/core/mock/mock_data.dart';
import 'package:kitchen_lens/core/theme/app_colors.dart';
import 'package:kitchen_lens/core/theme/app_dimensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({super.key});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  final Map<String, dynamic> recipe = MockData.recipes.first;
  bool _isChefReasoningExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          // Scrollable Content
          CustomScrollView(
            slivers: [
              // Hero Image App Bar
              SliverAppBar(
                expandedHeight: 350,
                pinned: true,
                backgroundColor: AppColors.background,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildGlassButton(
                    icon: LucideIcons.chevronLeft,
                    onTap: () => context.pop(),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildGlassButton(
                      icon: LucideIcons.bookmark,
                      onTap: () {},
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: recipe['imageUrl'],
                        fit: BoxFit.cover,
                      ),
                      // Dark gradient at bottom of image
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                AppColors.background,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Content
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.screenPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Transforming Overlapping Card (Moved up slightly via transform)
                      Transform.translate(
                        offset: const Offset(0, -30),
                        child: Container(
                          padding: const EdgeInsets.all(AppDimensions.lg),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusLg,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(20),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withAlpha(51),
                                      borderRadius: BorderRadius.circular(
                                        AppDimensions.radiusMax,
                                      ),
                                    ),
                                    child: Text(
                                      '${recipe['matchPercentage']}% Match',
                                      style: const TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: AppDimensions.sm),
                                  ...(recipe['tags'] as List? ?? [])
                                      .take(2)
                                      .map(
                                        (tag) => Container(
                                          margin: const EdgeInsets.only(
                                            right: 6,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.orange.withAlpha(51),
                                            borderRadius: BorderRadius.circular(
                                              AppDimensions.radiusMax,
                                            ),
                                          ),
                                          child: Text(
                                            tag,
                                            style: const TextStyle(
                                              color: Colors.orange,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                ],
                              ),
                              const SizedBox(height: AppDimensions.md),
                              Text(
                                recipe['title'],
                                style: theme.textTheme.displayMedium,
                              ),
                              const SizedBox(height: AppDimensions.lg),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildStatItem(
                                    theme,
                                    LucideIcons.clock,
                                    recipe['prepTime'] ?? '10m',
                                  ),
                                  _buildStatItem(
                                    theme,
                                    LucideIcons.flame,
                                    recipe['cookTime'] ?? '15m',
                                  ),
                                  _buildStatItem(
                                    theme,
                                    LucideIcons.chartBar,
                                    recipe['calories'] ?? '420 kcal',
                                  ),
                                  _buildStatItem(
                                    theme,
                                    LucideIcons.users,
                                    '${recipe['servings'] ?? 2}',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ).animate().fadeIn().slideY(begin: 0.1),

                      // Ingredients Section
                      Text(
                        'Ingredients',
                        style: theme.textTheme.titleLarge,
                      ).animate().fadeIn(delay: 100.ms),
                      const SizedBox(height: AppDimensions.md),
                      ...List.generate((recipe['ingredients'] as List).length, (
                        index,
                      ) {
                        final ingredient =
                            recipe['ingredients'][index]
                                as Map<String, dynamic>;
                        return Padding(
                              padding: const EdgeInsets.only(
                                bottom: AppDimensions.sm,
                              ),
                              child: _buildIngredientItem(theme, ingredient),
                            )
                            .animate()
                            .fadeIn(
                              delay: Duration(milliseconds: 200 + (index * 50)),
                            )
                            .slideX(begin: 0.1);
                      }),
                      const SizedBox(height: AppDimensions.xl),

                      // Instructions Section
                      Text(
                        'Instructions',
                        style: theme.textTheme.titleLarge,
                      ).animate().fadeIn(delay: 300.ms),
                      const SizedBox(height: AppDimensions.md),
                      ...List.generate(
                        (recipe['instructions'] as List).length,
                        (index) {
                          final instruction =
                              recipe['instructions'][index] as String;
                          return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary.withAlpha(25),
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        instruction,
                                        style: const TextStyle(
                                          height: 1.6,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .animate()
                              .fadeIn(
                                delay: Duration(
                                  milliseconds: 350 + (index * 60),
                                ),
                              )
                              .slideX(begin: 0.05);
                        },
                      ),

                      // AI Reasoning Accordion
                      const SizedBox(height: AppDimensions.xxl),
                      GestureDetector(
                        onTap: () => setState(
                          () => _isChefReasoningExpanded =
                              !_isChefReasoningExpanded,
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(AppDimensions.md),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withAlpha(15),
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusMd,
                            ),
                            border: Border.all(
                              color: AppColors.primary.withAlpha(128),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        LucideIcons.sparkles,
                                        color: AppColors.primary,
                                        size: 20,
                                      ),
                                      const SizedBox(width: AppDimensions.sm),
                                      Text(
                                        'AI Chef Reasoning',
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                              color: AppColors.primary,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    _isChefReasoningExpanded
                                        ? LucideIcons.chevronUp
                                        : LucideIcons.chevronDown,
                                    color: AppColors.primary,
                                  ),
                                ],
                              ),
                              if (_isChefReasoningExpanded) ...[
                                const SizedBox(height: AppDimensions.md),
                                Text(
                                  recipe['reasoning'] ??
                                      'This recipe was selected because it perfectly utilizes your scanned ingredients.',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ).animate().fadeIn(),
                              ],
                            ],
                          ),
                        ),
                      ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1),

                      const SizedBox(height: 100), // padding for bottom bar
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Bottom Action Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                AppDimensions.screenPadding,
                AppDimensions.md,
                AppDimensions.screenPadding,
                AppDimensions.md + MediaQuery.of(context).padding.bottom,
              ),
              decoration: BoxDecoration(
                color: AppColors.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: FilledButton(
                onPressed: () => context.push('/cook_mode'),
                child: const Text('Start Cooking'),
              ),
            ).animate().slideY(begin: 1, delay: 600.ms),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMax),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(50),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withAlpha(128)),
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(ThemeData theme, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 4),
        Text(
          text,
          style: theme.textTheme.labelMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientItem(
    ThemeData theme,
    Map<String, dynamic> ingredient,
  ) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(25),
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary),
          ),
          child: const Icon(
            LucideIcons.check,
            size: 14,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: AppDimensions.md),
        Text(ingredient['name'] ?? '', style: theme.textTheme.bodyLarge),
        const Spacer(),
        Text(ingredient['amount'] ?? '', style: theme.textTheme.bodySmall),
      ],
    );
  }
}
