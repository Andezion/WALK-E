// lib/features/home/widgets/daily_task_card.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class DailyTaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ежедневное задание', style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            Text('Пройти 20 минут в парке • +50 Eco Points'),
            SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _showTaskComplete(context),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent),
                  child: Text('Выполнить'),
                ),
                SizedBox(width: 12),
                OutlinedButton(
                    onPressed: () => _remindLater(context),
                    child: Text('Напомнить позже')
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showTaskComplete(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Готово!'),
          content: Text('Задание отмечено. +50 Eco Points.'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ОК')
            )
          ],
        )
    );
  }

  void _remindLater(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Напоминание через 1 час (только UI)'))
    );
  }
}