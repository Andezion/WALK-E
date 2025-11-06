import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ActivityHistoryList extends StatelessWidget {
  const ActivityHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
              'История активностей',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              )
          ),
        ),
        ...List.generate(4, (i) => _buildActivityItem(i)),
      ],
    );
  }

  Widget _buildActivityItem(int index) {
    final activities = [
      {'name': 'Прогулка', 'duration': 10 + index, 'points': (index + 1) * 10, 'level': (index % 3) + 1},
      {'name': 'Бег', 'duration': 20 + index * 2, 'points': (index + 1) * 15, 'level': (index % 3) + 1},
      {'name': 'Велосипед', 'duration': 30 + index * 3, 'points': (index + 1) * 20, 'level': (index % 3) + 2},
      {'name': 'Прогулка в парке', 'duration': 15 + index, 'points': (index + 1) * 12, 'level': (index % 3) + 1},
    ];

    final activity = activities[index];

    return Card(
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
            Icons.check_circle,
            color: AppColors.accent,
            size: 28
        ),
        title: Text(
            '${activity['name']} • ${activity['duration']} мин',
            style: TextStyle(fontWeight: FontWeight.w500)
        ),
        subtitle: Text(
            '+${activity['points']} Eco Points',
            style: TextStyle(color: AppColors.accent)
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12)
          ),
          child: Text(
              'ур. ${activity['level']}',
              style: TextStyle(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w600,
                  fontSize: 12
              )
          ),
        ),
      ),
    );
  }
}