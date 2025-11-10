import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class DrawRouteScreen extends StatelessWidget {
  final bool manual;
  const DrawRouteScreen({super.key, required this.manual});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(manual ? 'Hand painting' : 'Picture templates')
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: manual ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.draw, size: 64, color: AppColors.accent),
              SizedBox(height: 12),
              Text('This is where the user draws the route (UI placeholder)'),
              SizedBox(height: 12),
              ElevatedButton(
                  onPressed: () => _simulateDraw(context),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent),
                  child: Text('Save route')
              ),
            ],
          ) : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome, size: 64, color: AppColors.accent),
              SizedBox(height: 12),
              Text('Pick a template and adapt to the city'),
              SizedBox(height: 12),
              ElevatedButton(
                  onPressed: () => _simulateDraw(context),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent),
                  child: Text('Select a template')
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _simulateDraw(BuildContext ctx) {
    ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(content: Text('Route preserved (UI only)'))
    );
  }
}