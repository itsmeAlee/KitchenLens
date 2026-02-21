import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF19E65E);
  static const Color primaryDark = Color(0xFF14B84B);

  // Background
  static const Color backgroundLight = Color(0xFFF6F8F6);
  static const Color backgroundDark = Color(0xFF112116);

  // Surface
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(
    0xFF1A2C20,
  ); // slightly lighter than backgroundDark
  static const Color surfaceVariantLight = Color(0xFFF1F5F9); // slate-100
  static const Color surfaceVariantDark = Color(0xFF2D4434);

  // Text colors
  static const Color textMainLight = Color(0xFF111813);
  static const Color textSecondaryLight = Color(0xFF63886F);
  static const Color textMainDark = Color(0xFFF1F5F9); // slate-100
  static const Color textSecondaryDark = Color(0xFF94A3B8); // slate-400

  // Status/Functional
  static const Color success = Color(0xFF10B981); // emerald-500
  static const Color error = Color(0xFFEF4444); // red-500
  static const Color warning = Color(0xFFF59E0B); // amber-500

  // Glassmorphism overlays
  static const Color glassLight = Color(
    0xBFFFFFFF,
  ); // rgba(255, 255, 255, 0.75)
  static const Color glassDark = Color(0xBF112116); // rgba(17, 33, 22, 0.75)
  static const Color glassBorderLight = Color(
    0x66FFFFFF,
  ); // rgba(255, 255, 255, 0.4)
  static const Color glassBorderDark = Color(
    0x0DFFFFFF,
  ); // rgba(255, 255, 255, 0.05)
}
