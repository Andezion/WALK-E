import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class RewardCard extends StatelessWidget {
  final String title;
  final String description;
  final int cost;
  final VoidCallback onRedeem;
  final bool isAvailable;

  const RewardCard({super.key,
    required this.title,
    required this.description,
    required this.cost,
    required this.onRedeem,
    this.isAvailable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Opacity(
        opacity: isAvailable ? 1.0 : 0.6,
        child: ListTile(
          contentPadding: EdgeInsets.all(12),
          leading: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
                Icons.card_giftcard,
                color: AppColors.accent,
                size: 28
            ),
          ),
          title: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              )
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6),
              Text(description),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.eco, size: 14, color: AppColors.accent),
                  SizedBox(width: 4),
                  Text(
                      '$cost Eco Points',
                      style: TextStyle(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w600
                      )
                  ),
                ],
              ),
            ],
          ),
          trailing: ElevatedButton(
            onPressed: isAvailable ? onRedeem : null,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                disabledBackgroundColor: AppColors.dark.withOpacity(0.3),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)
            ),
            child: Text(
                'Обменять',
                style: TextStyle(fontSize: 12)
            ),
          ),
        ),
      ),
    );
  }
}