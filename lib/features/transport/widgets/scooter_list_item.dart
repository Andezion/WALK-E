// lib/features/transport/screens/scooter_detail_screen.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ScooterDetailScreen extends StatelessWidget {
  final int index;
  ScooterDetailScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Самокат #${index+1}')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
            children: [
              ListTile(
                  leading: Icon(Icons.electric_scooter, size: 48, color: AppColors.accent),
                  title: Text('Scooter #${index+1}')
              ),
              SizedBox(height: 8),
              Text('Battery: 80% • 120m • Цена: 0.5 PLN / мин'),
              Spacer(),
              ElevatedButton(
                  onPressed: () => _rent(context),
                  child: Text('Взять сейчас'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      minimumSize: Size.fromHeight(48)
                  )
              ),
            ]
        ),
      ),
    );
  }

  void _rent(BuildContext ctx) {
    Navigator.pop(ctx);
    ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(content: Text('Самокат разблокирован (UI only)'))
    );
  }
}