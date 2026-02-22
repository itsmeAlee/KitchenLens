import 'package:flutter/material.dart';
import 'package:kitchen_lens/core/theme/app_theme.dart';
import 'package:kitchen_lens/core/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'KitchenLens',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
