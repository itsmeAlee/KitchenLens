import 'package:flutter_riverpod/flutter_riverpod.dart';

// Mock Data Provider for UI only testing
final mockUserProvider = Provider<Map<String, dynamic>?>((ref) => null);

final mockRecipesProvider = Provider<List<Map<String, dynamic>>>(
  (ref) => [
    {
      'id': '1',
      'title': 'Garlic Butter Salmon',
      'dietary': ['Keto', 'Gluten-Free'],
      'prepTime': 20,
      'difficulty': 'Easy',
      'image':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCN6H_3ND6yDxjsUOUc-o4BDo3zVaQpcTQJv60cHg4K28sQCMJzbJOzVmzehuA-C3PgC5I2TcYwlYWP10KRnGtpJybISu0O9khP_hrBgoaX9_1sIdAc0rtefSoZ72xJpX3iZKJ4AiUFzN0HttF_ZY45m7gEe0crA51USd_ZGvj_x0_1OC5lCu3GMTVGBMZb6tzHZneKGVmuArgVY_hd1JnoHqZid_tZ1aCJrkVqPRn18QN6d9VBjP_13O_llOpZdnvhponxndyWOgGu',
    },
    {
      'id': '2',
      'title': 'Avocado Toast with Egg',
      'dietary': ['Vegetarian'],
      'prepTime': 10,
      'difficulty': 'Easy',
      'image':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDDKDKW9KBpXgAeoDm2wd9cAz16G6YXiO5oGw_2j74f-dRZFowUsbsVpupBaffUV5cIT_oKJNbXtDsrjtlFialhLgeV7WQqGtvPEHcq_9H-3_i-QMCODCaPybyxivOVw3Uoy8eX9G2ya09C7WaZfWEwv13cDiNynx8ab-lik2kruk9FNHBG9pu5yXsITskj3HfEGnMFEWZPekbvdgyj5hHnbcGE3oxGMK4S57Yx19bu2g0xVOFzp-0eIsYYaP7I0eL_SWzP_0c94To1',
    },
  ],
);

final mockIngredientsProvider = Provider<List<Map<String, dynamic>>>(
  (ref) => [
    {'name': 'Fresh Spinach', 'confidence': 0.98, 'freshness': 'Fresh'},
    {'name': 'Salmon Fillet', 'confidence': 0.95, 'freshness': 'Fresh'},
    {'name': 'Garlic', 'confidence': 0.88, 'freshness': 'Fresh'},
    {'name': 'Butter', 'confidence': 0.92, 'freshness': 'Fresh'},
    {'name': 'Lemon', 'confidence': 0.85, 'freshness': 'Fresh'},
  ],
);
