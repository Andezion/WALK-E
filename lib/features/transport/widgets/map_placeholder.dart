import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class MapPlaceholder extends StatelessWidget {
  const MapPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.dark.withOpacity(0.06),
        border: Border.all(color: AppColors.dark.withOpacity(0.08)),
      ),
      child: Center(
          child: Text(
              'MAP / Placeholder\n(интерактивность отключена)',
              textAlign: TextAlign.center
          )
      ),
    );
  }
}