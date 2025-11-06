import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class DrawRouteScreen extends StatelessWidget {
  final bool manual;
  const DrawRouteScreen({super.key, required this.manual});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(manual ? 'Ручное рисование' : 'Шаблоны рисунков')
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: manual ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.draw, size: 64, color: AppColors.accent),
              SizedBox(height: 12),
              Text('Здесь пользователь рисует маршрут (UI placeholder)'),
              SizedBox(height: 12),
              ElevatedButton(
                  onPressed: () => _simulateDraw(context),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent),
                  child: Text('Сохранить маршрут')
              ),
            ],
          ) : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome, size: 64, color: AppColors.accent),
              SizedBox(height: 12),
              Text('Выбери шаблон и адаптируй к городу'),
              SizedBox(height: 12),
              ElevatedButton(
                  onPressed: () => _simulateDraw(context),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent),
                  child: Text('Выбрать шаблон')
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _simulateDraw(BuildContext ctx) {
    ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(content: Text('Маршрут сохранён (UI only)'))
    );
  }
}