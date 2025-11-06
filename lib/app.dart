// lib/app.dart
import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'features/auth/screens/auth_gate_screen.dart';

class WalkEApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WALK-E',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.light,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accent),
        primaryColor: AppColors.deep,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.light,
          elevation: 0,
          foregroundColor: AppColors.dark,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(color: AppColors.dark, fontWeight: FontWeight.w700),
          bodyText2: TextStyle(color: AppColors.dark),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.accent,
        ),
      ),
      home: AuthGateScreen(),
    );
  }
}