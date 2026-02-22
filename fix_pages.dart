import 'dart:io';

void main() {
  var file = File('lib/features/cook_mode/presentation/pages/cook_mode_page.dart');
  var content = file.readAsStringSync();
  content = content.replaceAll(RegExp(r'\n\s*final isDark = theme\.brightness == Brightness\.dark;'), '');
  content = content.replaceAll(RegExp(r',\s*bool isDark'), '');
  content = content.replaceAll(RegExp(r',\s*isDark'), '');
  content = content.replaceAll(RegExp(r'isDark \? AppColors\.backgroundDark : const Color\(0xFFF8F9FA\)'), 'AppColors.backgroundAlt');
  content = content.replaceAll(RegExp(r'isDark \? Colors\.grey\.shade400 : const Color\(0xFF6C757D\)'), 'AppColors.textSecondary');
  content = content.replaceAll(RegExp(r'isDark \? Colors\.grey\.shade800 : const Color\(0xFFE9ECEF\)'), 'AppColors.surfaceBorder');
  content = content.replaceAll(RegExp(r'isDark \? Colors\.white : const Color\(0xFF1A1C1E\)'), 'AppColors.textPrimary');
  content = content.replaceAll(RegExp(r'Colors\.black\.withAlpha\(isDark \? 60 : 20\)'), 'Colors.black.withAlpha(20)');
  content = content.replaceAll(RegExp(r'isDark \? Colors\.grey\.shade800 : Colors\.grey\.shade200'), 'AppColors.surfaceVariant');
  content = content.replaceAll(RegExp(r'isDark \? Colors\.grey\.shade300 : const Color\(0xFF495057\)'), 'AppColors.textSecondary');
  content = content.replaceAll(RegExp(r'isDark \? AppColors\.surfaceDark : Colors\.white'), 'AppColors.surface');
  content = content.replaceAll(RegExp(r'isDark \? Colors\.grey\.shade800 : const Color\(0xFFF8F9FA\)'), 'AppColors.surface');
  content = content.replaceAll(RegExp(r'isDark \? Colors\.grey\.shade700 : const Color\(0xFFE9ECEF\)'), 'AppColors.surfaceBorder');
  content = content.replaceAll(RegExp(r'isDark \? Colors\.grey\.shade300 : Colors\.grey\.shade800'), 'AppColors.textSecondary');
  
  file.writeAsStringSync(content);
  
  file = File('lib/features/recipes/presentation/pages/recipe_detail_page.dart');
  content = file.readAsStringSync();
  content = content.replaceAll(RegExp(r'\n\s*final isDark = theme\.brightness == Brightness\.dark;'), '');
  content = content.replaceAll(RegExp(r',\s*bool isDark'), '');
  content = content.replaceAll(RegExp(r',\s*isDark'), '');
  content = content.replaceAll(RegExp(r'isDark\s*\?\s*AppColors\.backgroundDark\s*:\s*AppColors\.backgroundLight'), 'AppColors.background');
  content = content.replaceAll(RegExp(r'isDark\s*\?\s*AppColors\.surfaceDark\s*:\s*Colors\.white'), 'AppColors.surface');
  content = content.replaceAll(RegExp(r'isDark\s*\?\s*AppColors\.surfaceVariantDark\.withAlpha\(128\)\s*:\s*AppColors\.primary\.withAlpha\(15\)'), 'AppColors.primary.withAlpha(15)');
  content = content.replaceAll(RegExp(r'isDark \? Colors\.grey\.shade400 : AppColors\.textSecondaryLight'), 'AppColors.textSecondary');
  content = content.replaceAll(RegExp(r'isDark \? Colors\.grey\.shade300 : Colors\.grey\.shade800'), 'AppColors.textSecondary');
  content = content.replaceAll(RegExp(r'Colors\.black\.withAlpha\(isDark \? 50 : 20\)'), 'Colors.black.withAlpha(20)');
  
  file.writeAsStringSync(content);
}
