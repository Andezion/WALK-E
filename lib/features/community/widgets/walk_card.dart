// lib/features/community/widgets/walk_card.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class WalkCard extends StatelessWidget {
  final String title;
  final String distance;
  final String time;
  final int participants;
  final VoidCallback onJoin;

  const WalkCard({
    required this.title,
    required this.distance,
    required this.time,
    required this.participants,
    required this.onJoin,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        leading: CircleAvatar(
            backgroundColor: AppColors.accent,
            child: Icon(Icons.directions_walk, color: Colors.white)
        ),
        title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600)
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 6),
          child: Row(
            children: [
              Icon(Icons.straighten, size: 14, color: AppColors.dark.withOpacity(0.6)),
              SizedBox(width: 4),
              Text(distance),
              SizedBox(width: 12),
              Icon(Icons.access_time, size: 14, color: AppColors.dark.withOpacity(0.6)),
              SizedBox(width: 4),
              Text(time),
              SizedBox(width: 12),
              Icon(Icons.people, size: 14, color: AppColors.dark.withOpacity(0.6)),
              SizedBox(width: 4),
              Text('$participants участн.'),
            ],
          ),
        ),
        trailing: ElevatedButton(
          onPressed: onJoin,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)
          ),
          child: Text('Присоединиться', style: TextStyle(fontSize: 12)),
        ),
      ),
    );
  }
}