import 'dart:io';

void main() {
  final filesToClean = [
    'lib/features/auth/presentation/pages/auth_page.dart',
    'lib/features/home/presentation/pages/home_page.dart',
    'lib/features/ingredients/presentation/pages/ingredients_review_page.dart',
    'lib/features/scan/presentation/pages/processing_page.dart',
    'lib/features/scan_result/presentation/pages/scan_result_page.dart',
  ];

  for (final path in filesToClean) {
    final file = File(path);
    if (!file.existsSync()) continue;
    var content = file.readAsStringSync();
    content = content.replaceAll("import 'dart:ui';\n", "");
    file.writeAsStringSync(content);
  }

  // capture_page: remove _toggleMode
  final capturePage = File('lib/features/scan/presentation/pages/capture_page.dart');
  if (capturePage.existsSync()) {
    var content = capturePage.readAsStringSync();
    content = content.replaceAll(RegExp(r'void _toggleMode\(\) \{[\s\S]*?\}'), '');
    capturePage.writeAsStringSync(content);
  }
}
