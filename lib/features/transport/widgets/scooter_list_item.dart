import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ScooterDetailScreen extends StatelessWidget {
  final int index;
  const ScooterDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scooter #${index+1}')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
            children: [
              ListTile(
                  leading: Icon(Icons.electric_scooter, size: 48, color: AppColors.accent),
                  title: Text('Scooter #${index+1}')
              ),
              SizedBox(height: 8),
              Text('Battery: 80% • 120m • Cost: 0.5 PLN / min'),
              Spacer(),
              ElevatedButton(
                  onPressed: () => _rent(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      minimumSize: Size.fromHeight(48)
                  ),
                  child: Text('Take it now')
              ),
            ]
        ),
      ),
    );
  }

  void _rent(BuildContext ctx) {
    Navigator.pop(ctx);
    ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(content: Text('Scooter unlocked (UI only)'))
    );
  }
}