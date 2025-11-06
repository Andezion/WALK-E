import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class GalleryItem extends StatelessWidget {
  final int index;
  final String? title;
  final VoidCallback? onTap;

  const GalleryItem({super.key,
    required this.index,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
                colors: [
                  AppColors.accent.withOpacity(0.9),
                  AppColors.deep.withOpacity(0.9)
                ]
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withOpacity(0.3),
                blurRadius: 8,
                offset: Offset(0, 4),
              )
            ]
        ),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.route, color: Colors.white, size: 32),
                SizedBox(height: 8),
                Text(
                    title ?? 'Рисунок ${index + 1}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    )
                ),
              ],
            )
        ),
      ),
    );
  }
}