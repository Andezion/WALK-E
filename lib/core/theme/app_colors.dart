// lib/core/theme/app_colors.dart
import 'package:flutter/material.dart';

/// #231971, #2A2742, #5E4CE6, #FAFAFA
class AppColors {
  static const Color deep = Color(0xFF231971);
  static const Color dark = Color(0xFF2A2742);
  static const Color accent = Color(0xFF5E4CE6);
  static const Color light = Color(0xFFFAFAFA);

  static const Gradient bgGradient = LinearGradient(
    colors: [dark, deep],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}