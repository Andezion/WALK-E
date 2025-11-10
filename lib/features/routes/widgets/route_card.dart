import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class RouteCard extends StatelessWidget {
  final String title;
  final String distance;
  final int points;
  final String? imagePath;
  final VoidCallback? onTap;
  final VoidCallback? onShare;

  const RouteCard({super.key,
    required this.title,
    required this.distance,
    required this.points,
    this.imagePath,
    this.onTap,
    this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [
                        AppColors.accent.withOpacity(0.7),
                        AppColors.deep.withOpacity(0.7)
                      ]
                  ),
                ),
                child: Icon(
                    Icons.map,
                    color: Colors.white,
                    size: 32
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                        )
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                            Icons.straighten,
                            size: 14,
                            color: AppColors.dark.withOpacity(0.6)
                        ),
                        SizedBox(width: 4),
                        Text(
                            'Length: $distance',
                            style: TextStyle(
                                fontSize: 13,
                                color: AppColors.dark.withOpacity(0.7)
                            )
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                            Icons.eco,
                            size: 14,
                            color: AppColors.accent
                        ),
                        SizedBox(width: 4),
                        Text(
                            'Points: $points',
                            style: TextStyle(
                                fontSize: 13,
                                color: AppColors.accent,
                                fontWeight: FontWeight.w600
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (onShare != null)
                IconButton(
                  onPressed: onShare,
                  icon: Icon(Icons.share, color: AppColors.accent),
                  tooltip: 'Share',
                ),
            ],
          ),
        ),
      ),
    );
  }
}