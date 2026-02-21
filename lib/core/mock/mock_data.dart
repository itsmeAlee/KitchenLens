class MockData {
  // ── User Profile ──
  static const Map<String, dynamic> userProfile = {
    'name': 'Sophia Chen',
    'email': 'sophia.c@kitchenlens.com',
    'initials': 'SC',
    'recipesCooked': 42,
    'scannedItems': 158,
    'wasteSaved': '3.2 kg',
  };

  // ── Dietary Options ──
  static const List<String> commonDiets = [
    'Vegetarian',
    'Vegan',
    'Keto',
    'Paleo',
    'Gluten-Free',
    'Mediterranean',
    'Halal',
  ];

  static const List<Map<String, dynamic>> allergies = [
    {'name': 'Shellfish', 'icon': '🦐', 'materialIcon': 'set_meal', 'subtitle': 'Strict avoid'},
    {'name': 'Nuts', 'icon': '🥜', 'materialIcon': 'nutrition', 'subtitle': 'Peanuts, etc.'},
    {'name': 'Eggs', 'icon': '🥚', 'materialIcon': 'egg', 'subtitle': ''},
    {'name': 'Dairy', 'icon': '🥛', 'materialIcon': 'water_drop', 'subtitle': ''},
    {'name': 'Soy', 'icon': '🫘', 'materialIcon': 'grain', 'subtitle': ''},
    {'name': 'Wheat', 'icon': '🌾', 'materialIcon': 'grass', 'subtitle': ''},
  ];

  // ── Recent Scans ──
  static const List<Map<String, dynamic>> recentScans = [
    {
      'id': 'scan_1',
      'title': 'Honey Glazed Salmon',
      'ingredientCount': 5,
      'time': '25 min',
      'author': 'Chef Sarah',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCN6H_3ND6yDxjsUOUc-o4BDo3zVaQpcTQJv60cHg4K28sQCMJzbJOzVmzehuA-C3PgC5I2TcYwlYWP10KRnGtpJybISu0O9khP_hrBgoaX9_1sIdAc0rtefSoZ72xJpX3iZKJ4AiUFzN0HttF_ZY45m7gEe0crA51USd_ZGvj_x0_1OC5lCu3GMTVGBMZb6tzHZneKGVmuArgVY_hd1JnoHqZid_tZ1aCJrkVqPRn18QN6d9VBjP_13O_llOpZdnvhponxndyWOgGu',
    },
    {
      'id': 'scan_2',
      'title': 'Avocado Toast & Egg',
      'ingredientCount': 3,
      'time': '10 min',
      'author': 'Mike C.',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDDKDKW9KBpXgAeoDm2wd9cAz16G6YXiO5oGw_2j74f-dRZFowUsbsVpupBaffUV5cIT_oKJNbXtDsrjtlFialhLgeV7WQqGtvPEHcq_9H-3_i-QMCODCaPybyxivOVw3Uoy8eX9G2ya09C7WaZfWEwv13cDiNynx8ab-lik2kruk9FNHBG9pu5yXsITskj3HfEGnMFEWZPekbvdgyj5hHnbcGE3oxGMK4S57Yx19bu2g0xVOFzp-0eIsYYaP7I0eL_SWzP_0c94To1',
    },
  ];

  // ── Detected Ingredients (Scan Result) ──
  static const List<Map<String, dynamic>> detectedIngredients = [
    {'name': 'Salmon', 'emoji': '🐟', 'confidence': 0.98, 'bgColor': 0xFFFFF7ED},
    {'name': 'Broccoli', 'emoji': '🥦', 'confidence': 0.95, 'bgColor': 0xFFF0FDF4},
    {'name': 'Lemon', 'emoji': '🍋', 'confidence': 0.92, 'bgColor': 0xFFFEFCE8},
    {'name': 'Garlic', 'emoji': '🧄', 'confidence': 0.91, 'bgColor': 0xFFFEF2F2},
    {'name': 'Butter', 'emoji': '🧈', 'confidence': 0.88, 'bgColor': 0xFFF8FAFC},
    {'name': 'Asparagus', 'emoji': '🌿', 'confidence': 0.85, 'bgColor': 0xFFF0FDF4},
    {'name': 'Olive Oil', 'emoji': '🫒', 'confidence': 0.82, 'bgColor': 0xFFFEFCE8},
    {'name': 'Cherry Tomatoes', 'emoji': '🍅', 'confidence': 0.79, 'bgColor': 0xFFFEF2F2},
  ];

  // ── Recipes ──
  static const List<Map<String, dynamic>> recipes = [
    {
      'id': 'rec_1',
      'title': 'Lemon Butter Pan-Seared Salmon',
      'matchPercentage': 98,
      'time': '25 min',
      'prepTime': '10m',
      'cookTime': '15m',
      'difficulty': 'Easy',
      'calories': '385 kcal',
      'servings': 2,
      'protein': '42g',
      'carbs': '6g',
      'tags': ['Keto', 'Gluten-Free', 'High Protein'],
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCN6H_3ND6yDxjsUOUc-o4BDo3zVaQpcTQJv60cHg4K28sQCMJzbJOzVmzehuA-C3PgC5I2TcYwlYWP10KRnGtpJybISu0O9khP_hrBgoaX9_1sIdAc0rtefSoZ72xJpX3iZKJ4AiUFzN0HttF_ZY45m7gEe0crA51USd_ZGvj_x0_1OC5lCu3GMTVGBMZb6tzHZneKGVmuArgVY_hd1JnoHqZid_tZ1aCJrkVqPRn18QN6d9VBjP_13O_llOpZdnvhponxndyWOgGu',
      'ingredients': [
        {'name': 'Fresh Salmon Fillets', 'amount': '2 pcs (400g)', 'checked': false},
        {'name': 'Green Asparagus', 'amount': '1 bunch', 'checked': false},
        {'name': 'Extra Virgin Olive Oil', 'amount': '2 tbsp', 'checked': false},
        {'name': 'Fresh Lemon', 'amount': '1/2 unit', 'checked': false},
        {'name': 'Garlic Cloves', 'amount': '3 cloves', 'checked': false},
        {'name': 'Butter', 'amount': '2 tbsp', 'checked': false},
      ],
      'instructions': [
        'Season salmon fillets generously with salt and pepper. Pat the skin dry with a paper towel for extra crispiness.',
        'Heat olive oil in a large skillet over medium-high heat. Place salmon skin-side down and cook for 4-5 minutes until crispy.',
        'Flip the salmon and add asparagus to the pan. Sauté for another 4 minutes until the salmon is cooked through and asparagus is tender.',
        'Add butter and garlic to the pan. Baste the salmon with the melted garlic butter for 1 minute.',
        'Squeeze fresh lemon juice over everything and serve immediately.',
      ],
      'reasoning':
          'I noticed you have fresh salmon and a bunch of asparagus in your fridge that need to be used within 24 hours. This recipe perfectly utilizes those ingredients while keeping your meal under 500 calories as per your health goals.',
    },
    {
      'id': 'rec_2',
      'title': 'Lemon Butter Pasta',
      'matchPercentage': 85,
      'time': '15 min',
      'prepTime': '5m',
      'cookTime': '10m',
      'difficulty': 'Intermediate',
      'calories': '420 kcal',
      'servings': 2,
      'protein': '12g',
      'carbs': '52g',
      'tags': ['Vegetarian'],
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDDKDKW9KBpXgAeoDm2wd9cAz16G6YXiO5oGw_2j74f-dRZFowUsbsVpupBaffUV5cIT_oKJNbXtDsrjtlFialhLgeV7WQqGtvPEHcq_9H-3_i-QMCODCaPybyxivOVw3Uoy8eX9G2ya09C7WaZfWEwv13cDiNynx8ab-lik2kruk9FNHBG9pu5yXsITskj3HfEGnMFEWZPekbvdgyj5hHnbcGE3oxGMK4S57Yx19bu2g0xVOFzp-0eIsYYaP7I0eL_SWzP_0c94To1',
      'ingredients': [],
      'instructions': [],
      'reasoning': 'A quick pasta using your lemon and butter with pantry staples.',
    },
    {
      'id': 'rec_3',
      'title': 'Pan-Seared Veggies',
      'matchPercentage': 72,
      'time': '20 min',
      'prepTime': '10m',
      'cookTime': '10m',
      'difficulty': 'Easy',
      'calories': '180 kcal',
      'servings': 2,
      'protein': '5g',
      'carbs': '18g',
      'tags': ['Vegan', 'Low-Cal'],
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDUw-h7mB6Z2GyEJEcme-BEmYU7mtfb4mNF98fYpXGTaur22GI31vwTbZHrxbMxwrx-I5tJAnZEycKsG9smo183xHFld8_DVvwffkRPMsbHYMDdC5Eugmrrng6JIAwwz6hQpoh9cWtMquSDFc6Jf4nb5IEN6GdFI2tc7A3a3yL-J2ovW-wOyMvKKJzehhBuHsyKo2r1SKJ4-9dj3rxg-dl_zWcC60PKtNiAPh0Ct7vj1XWRbUrcJGzObjM43XgYiOShZVDXfFBEEyIk',
      'ingredients': [],
      'instructions': [],
      'reasoning': 'Healthy mix of your detected vegetables.',
    },
  ];

  // ── Cook Mode Steps ──
  static const List<Map<String, dynamic>> cookModeSteps = [
    {
      'step': 1,
      'title': 'Prepare the Salmon',
      'description': 'Season salmon fillets generously with salt and pepper. Pat the skin dry for extra crispiness.',
      'timerMinutes': 0,
      'tip': 'Let the salmon rest at room temperature for 10 minutes before cooking for more even results.',
      'imageUrl': 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?auto=format&fit=crop&q=80&w=800',
    },
    {
      'step': 2,
      'title': 'Heat the Pan',
      'description': 'Heat olive oil in a large skillet over medium-high heat until it shimmers.',
      'timerMinutes': 2,
      'tip': 'The oil should shimmer but not smoke. If it smokes, reduce the heat slightly.',
      'imageUrl': 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?auto=format&fit=crop&q=80&w=800',
    },
    {
      'step': 3,
      'title': 'Sear the Salmon',
      'description': 'Place salmon skin-side down. Sear for 4 minutes until golden brown.',
      'timerMinutes': 4,
      'tip': "Don't move the fish once it's in the pan. Let the crust form naturally for easier flipping.",
      'imageUrl': 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?auto=format&fit=crop&q=80&w=800',
    },
    {
      'step': 4,
      'title': 'Flip & Add Veggies',
      'description': 'Flip the salmon and add asparagus to the pan. Cook for another 4 minutes.',
      'timerMinutes': 4,
      'tip': 'Arrange asparagus in a single layer for even cooking.',
      'imageUrl': 'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&q=80&w=800',
    },
    {
      'step': 5,
      'title': 'Add Garlic Butter',
      'description': 'Add butter and minced garlic. Baste the salmon with melted garlic butter.',
      'timerMinutes': 1,
      'tip': 'Tilt the pan slightly and use a spoon to scoop the butter over the salmon.',
      'imageUrl': 'https://images.unsplash.com/photo-1551218808-94e220e084d2?auto=format&fit=crop&q=80&w=800',
    },
    {
      'step': 6,
      'title': 'Finish with Lemon',
      'description': 'Squeeze fresh lemon juice over the salmon and asparagus. Season to taste.',
      'timerMinutes': 0,
      'tip': 'Use half a lemon and squeeze through your fingers to catch any seeds.',
      'imageUrl': 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?auto=format&fit=crop&q=80&w=800',
    },
    {
      'step': 7,
      'title': 'Plate & Garnish',
      'description': 'Transfer salmon and asparagus to plates. Drizzle with remaining pan juices.',
      'timerMinutes': 0,
      'tip': 'A sprinkle of flaky sea salt and fresh dill elevates the presentation.',
      'imageUrl': 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?auto=format&fit=crop&q=80&w=800',
    },
    {
      'step': 8,
      'title': 'Serve & Enjoy!',
      'description': 'Serve immediately while hot. Pair with a crisp white wine or sparkling water with lemon.',
      'timerMinutes': 0,
      'tip': 'This dish is best enjoyed fresh. Leftovers can be stored for up to 2 days in the fridge.',
      'imageUrl': 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?auto=format&fit=crop&q=80&w=800',
    },
  ];

  // ── Processing Steps ──
  static const List<Map<String, dynamic>> processingSteps = [
    {'label': 'Uploading', 'sublabel': 'Image successfully uploaded'},
    {'label': 'Analyzing ingredients...', 'sublabel': 'Identifying vegetables & proteins'},
    {'label': 'Generating Recipes', 'sublabel': 'Waiting for analysis'},
  ];

  // ── Hero Images ──
  static const String heroVegetablesUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDUw-h7mB6Z2GyEJEcme-BEmYU7mtfb4mNF98fYpXGTaur22GI31vwTbZHrxbMxwrx-I5tJAnZEycKsG9smo183xHFld8_DVvwffkRPMsbHYMDdC5Eugmrrng6JIAwwz6hQpoh9cWtMquSDFc6Jf4nb5IEN6GdFI2tc7A3a3yL-J2ovW-wOyMvKKJzehhBuHsyKo2r1SKJ4-9dj3rxg-dl_zWcC60PKtNiAPh0Ct7vj1XWRbUrcJGzObjM43XgYiOShZVDXfFBEEyIk';
  static const String onboardingHeroUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuARqtoe82tw_mQR7UxhEuLIMP1t0PtyibS-SGBTq8c8-h8Wra8DVe2p02TTvqUXHP6eL6rfxf0kBPH0rOmYNwdGHYKkOeQ8unN0jWTpw7DdC0HJ-eBL0IO2CD_wOv2FhJQIgzGN204uorIMkIG025hJ4fI7f9cLzS3Z6CPD2AYLC_QJTPr3lvEEcIgwsgmmF5aAPIAdo08Zt-uOaN-nHGfw_DRQzoxKdpCfMrIXpc541sdbHJ2BfeRpnYoKDE3lb0YyIBNJqHp_b_7S';
  static const String authBackgroundUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAE7cd_IugnuASu951DnmjnX66Ljw5h5J_3jDt0rmz-YS-AU4znOlh36Wo3hcXO8TT9gAFBefFDFD72gU5kbOscQB7FTYMpkyENdvCfLoFh9DGjdWitBDSkuKI6eQg0pepB74y7PAOfz46UExSeR-0YYFy3lzGC7l81UlT7KgBDdIL8-RjSDHktHnZHB-6bMDQXGbI8M44j2NTHj8G3sxNihf3zYiiYPX3iYRxflGEtw3aISG9Zuwka-9Y-BgrdO2enLJvZI3ns_aeN';
  static const String fridgeInteriorUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDnwA49SJ9FaTV7_sUgkdAMKTj1TRwqOTGCSXfoauH-G08VVf9QY__QPm55E0ftRQehoiKGU1buZgPQ42QQgGSc_1DDosjkBEYSwNxQGdQC_If0Bo3_NCO8lvWldLHYpdrl7LM7Gx0idoZ914focYBS6D-q4DU1YXLt05acaBlZUgxWdT7lrOGvFYrFp7tHId4p9KpulVLXfZD9XLj_hx-0ij2mu4Z60FtPI1JNFfjwZAEqoKCvoADe121SylFKZCAsGy2zLfXL7MQk';
  static const String processingBgUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAhxDE8VujjDH7hNOJQcDI5Wowyy9P-8-0RbJJVaxwxt_DlJMZc3DLhUMXKJkExczSjH5IoVKqLsEPQT8FI2p-slT38DglJR8KlMMF19TAu9ojLjRYjpRYkYF3EG4m2fhUbZmeohIm7mCdyqk2zr3c3si5PQwPIExrqCfeNSaM7W1xZiVsWt6Fiwfotzp1XKzAqIq18Mcv-AZgSGON7AGjErE14bzVFfUr7RHrrjv11SMoEiuooYkwOWeo0PG-jk33tCcZ0RGvdAucw';
  static const String recipeHeroUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCkWBFOmsAqRA2_9ew0w13UBFdp8AFb9M5dDBRlYkmm1y-67QowIsWU6TtYTFFzkQlsbnrkjtBCjijT69FRCXh8isVzlJFFgkfR93QvOitx0ViMwKraqeAT25CWPITFfjWk8HJcfWQx39jCypAubzZww8LndeLnPoqgyGs_fSddk9Mb0V8ZrqfI5q_S_nzOWS8aVJSZZc9BwogZ7YK0wqKp_umtmJiWU0-dUWPzsuIv6cvJu-18hb4GhM2P_DnEXY2fj6z5Gg0BUPfQ';
}
