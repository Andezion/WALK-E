// lib/features/transport/widgets/scooter_list_item.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ScooterListItem extends StatelessWidget {
  final int index;
  final int batteryPercent;
  final int distanceMeters;
  final VoidCallback onTap;

  const ScooterListItem({
    required this.index,
    required this.batteryPercent,
    required this.distanceMeters,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        leading: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.accent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
              Icons.electric_scooter,
              color: AppColors.accent,
              size: 28
          ),
        ),
        title: Text(
            'Scooter #${index + 1}',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16
            )
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            children: [
              _buildInfoChip(
                  Icons.battery_charging_full,
                  '$batteryPercent%',
                  _getBatteryColor(batteryPercent)
              ),
              SizedBox(width: 8),
              _buildInfoChip(
                  Icons.location_on,
                  '$distanceMeters м',
                  AppColors.dark.withOpacity(0.6)
              ),
            ],
          ),
        ),
        trailing: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)
          ),
          child: Text('Взять', style: TextStyle(fontSize: 12)),
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          SizedBox(width: 4),
          Text(
              text,
              style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w600
              )
          ),
        ],
      ),
    );
  }

  Color _getBatteryColor(int percent) {
    if (percent >= 60) return Colors.green;
    if (percent >= 30) return Colors.orange;
    return Colors.red;
  }
}