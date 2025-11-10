import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class CustomizationScreen extends StatelessWidget {
  const CustomizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Profile customization')),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Backgrounds', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Wrap(
                      spacing: 8,
                      children: List.generate(4, (i) => GestureDetector(
                          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Background selected ${i+1}'))
                          ),
                          child: Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.accent.withOpacity(0.7),
                                        AppColors.deep.withOpacity(0.7)
                                      ]
                                  )
                              )
                          )
                      ))
                  ),
                  SizedBox(height: 12),
                  Text('Frames and badges', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Wrap(
                      spacing: 8,
                      children: List.generate(6, (i) => Chip(
                          label: Text('Badge ${i+1}'),
                          backgroundColor: i % 2 == 0
                              ? AppColors.accent
                              : AppColors.dark.withOpacity(0.1)
                      ))
                  )
                ]
            )
        )
    );
  }
}