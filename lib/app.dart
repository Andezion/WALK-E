import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'features/auth/screens/auth_gate_screen.dart';

class WalkEApp extends StatelessWidget {
  const WalkEApp({super.key});

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
          titleLarge: TextStyle(color: AppColors.dark, fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(color: AppColors.dark),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.accent,
        ),
      ),
      home: AuthGateScreen(),
    );
  }
}