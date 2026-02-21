import 'package:flutter/material.dart';
import 'package:kitchen_lens/core/theme/app_colors.dart';
import 'package:kitchen_lens/core/theme/app_dimensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StepThreeDiet extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const StepThreeDiet({super.key, required this.onNext, required this.onSkip});

  @override
  State<StepThreeDiet> createState() => _StepThreeDietState();
}

class _StepThreeDietState extends State<StepThreeDiet> {
  final Set<String> _selectedDiets = {'Vegetarian'};
  final Set<String> _selectedAllergies = {'Shellfish'};

  final List<String> _diets = [
    'Vegetarian',
    'Vegan',
    'Keto',
    'Paleo',
    'Gluten-Free',
    'Mediterranean',
  ];
  final List<Map<String, dynamic>> _allergies = [
    {'name': 'Shellfish', 'icon': LucideIcons.fish, 'desc': 'Strict avoid'},
    {'name': 'Nuts', 'icon': LucideIcons.nut, 'desc': 'Peanuts, etc.'},
    {'name': 'Eggs', 'icon': LucideIcons.egg, 'desc': ''},
    {'name': 'Dairy', 'icon': LucideIcons.milk, 'desc': ''},
    {'name': 'Soy', 'icon': LucideIcons.bean, 'desc': ''},
    {'name': 'Wheat', 'icon': LucideIcons.wheat, 'desc': ''},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SafeArea(
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppDimensions.screenPadding,
              AppDimensions.xl,
              AppDimensions.screenPadding,
              AppDimensions.sm,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.grey.shade700
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.grey.shade700
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 32,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.xl),
                Text(
                  'Dietary Preferences',
                  style: theme.textTheme.displaySmall,
                ).animate().fadeIn().slideY(begin: 0.1),
                const SizedBox(height: AppDimensions.sm),
                Text(
                  'Customize your experience. We\'ll tailor recipes and suggestions to fit your lifestyle.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1),
              ],
            ),
          ),

          // Search SearchBar
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.screenPadding,
              vertical: AppDimensions.md,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search diets, ingredients...',
                prefixIcon: const Icon(LucideIcons.search),
                fillColor: isDark
                    ? AppColors.surfaceDark
                    : Colors.grey.shade100,
              ),
            ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
          ),

          // Scrollable Content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.screenPadding,
              ),
              children: [
                // Diets
                Text(
                  'COMMON DIETS',
                  style: theme.textTheme.labelSmall?.copyWith(
                    letterSpacing: 1.2,
                  ),
                ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1),
                const SizedBox(height: AppDimensions.sm),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _diets.map((diet) {
                    final isSelected = _selectedDiets.contains(diet);
                    return ChoiceChip(
                      label: Text(diet),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedDiets.add(diet);
                          } else {
                            _selectedDiets.remove(diet);
                          }
                        });
                      },
                      selectedColor: AppColors.primary,
                      backgroundColor: isDark
                          ? AppColors.surfaceVariantDark
                          : Colors.grey.shade100,
                      labelStyle: TextStyle(
                        color: isSelected
                            ? AppColors.textMainLight
                            : (isDark
                                  ? AppColors.textMainDark
                                  : AppColors.textMainLight),
                        fontWeight: FontWeight.w600,
                      ),
                      checkmarkColor: AppColors.textMainLight,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusMax,
                        ),
                      ),
                    );
                  }).toList(),
                ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1),

                const SizedBox(height: AppDimensions.xl),

                // Allergies
                Text(
                  'ALLERGIES & INTOLERANCES',
                  style: theme.textTheme.labelSmall?.copyWith(
                    letterSpacing: 1.2,
                  ),
                ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1),
                const SizedBox(height: AppDimensions.sm),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: _allergies.length,
                  itemBuilder: (context, index) {
                    final allergy = _allergies[index];
                    final isSelected = _selectedAllergies.contains(
                      allergy['name'],
                    );

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedAllergies.remove(allergy['name']);
                          } else {
                            _selectedAllergies.add(allergy['name']);
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary.withAlpha(25)
                              : (isDark
                                    ? AppColors.surfaceVariantDark
                                    : Colors.white),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : (isDark
                                      ? AppColors.surfaceVariantDark
                                      : Colors.grey.shade200),
                            width: isSelected ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusMd,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primary
                                    : (isDark
                                          ? Colors.grey.shade800
                                          : Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                allergy['icon'],
                                size: 16,
                                color: isSelected
                                    ? AppColors.textMainLight
                                    : AppColors.textSecondaryLight,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    allergy['name'],
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: isDark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  if (allergy['desc'].toString().isNotEmpty)
                                    Text(
                                      allergy['desc'],
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(fontSize: 10),
                                    ),
                                ],
                              ),
                            ),
                            if (isSelected)
                              const Icon(
                                Icons.check_circle_outline,
                                color: AppColors.primary,
                                size: 16,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.1),
                const SizedBox(height: AppDimensions.xxl),
              ],
            ),
          ),

          // Footer Actions
          Container(
            padding: const EdgeInsets.all(AppDimensions.screenPadding),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.backgroundDark
                  : AppColors.backgroundLight,
              border: Border(
                top: BorderSide(
                  color: isDark
                      ? AppColors.surfaceVariantDark
                      : Colors.grey.shade200,
                ),
              ),
            ),
            child: Column(
              children: [
                FilledButton(
                  onPressed: widget.onNext,
                  child: const Text('Save Preferences'),
                ),
                const SizedBox(height: AppDimensions.xs),
                TextButton(
                  onPressed: widget.onSkip,
                  child: Text(
                    'Skip for now',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: AppColors.textSecondaryLight,
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.1),
        ],
      ),
    );
  }
}
