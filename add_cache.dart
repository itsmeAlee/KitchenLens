import 'dart:io';

void main() {
  final files = [
    'lib/features/scan/presentation/pages/processing_page.dart',
    'lib/features/scan_result/presentation/pages/scan_result_page.dart',
    'lib/features/recipes/presentation/pages/recipe_detail_page.dart',
    'lib/features/onboarding/presentation/widgets/step_one_welcome.dart',
    'lib/features/home/presentation/pages/home_page.dart',
    'lib/features/cook_mode/presentation/pages/cook_mode_page.dart',
  ];

  for (var path in files) {
    var file = File(path);
    if (!file.existsSync()) continue;
    var content = file.readAsStringSync();
    
    // add memCacheWidth
    content = content.replaceAll(
      RegExp(r'CachedNetworkImage\(\n\s*imageUrl'), 
      'CachedNetworkImage(\n      memCacheWidth: 600,\n      imageUrl'
    );
    // add memCacheWidth to 1-liners
    content = content.replaceAll(
      RegExp(r'CachedNetworkImage\(imageUrl'), 
      'CachedNetworkImage(memCacheWidth: 600, imageUrl'
    );
    
    file.writeAsStringSync(content);
  }
  print('Added memCacheWidth');
}
