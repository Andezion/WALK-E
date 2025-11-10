import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class DailyTaskCard extends StatelessWidget {
  const DailyTaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Daily task', style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            Text('Walk 20 minutes in a park • +50 Sprouts'),
            SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _showTaskComplete(context),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent),
                  child: Text('Execute'),
                ),
                SizedBox(width: 12),
                OutlinedButton(
                    onPressed: () => _remindLater(context),
                    child: Text('Remind me later')
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
          title: Text('Done!'),
          content: Text('The task is marked. +50 Sprouts.'),
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
        SnackBar(content: Text('Reminder after 1 hour (only UI)'))
    );
  }
}