// lib/features/routes/screens/routes_screen.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../community/screens/draw_route_screen.dart';
import 'competitions_screen.dart';

class RoutesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Маршруты / Рисование'),
        actions: [
          IconButton(
              icon: Icon(Icons.emoji_events),
              onPressed: () => _openCompetitions(context)
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.brush, color: AppColors.accent),
              title: Text('Нарисовать маршрут'),
              subtitle: Text('Создай маршрут-рисунок: сердечко, смайлик, звезда'),
              trailing: ElevatedButton(
                  onPressed: () => _drawManual(context),
                  child: Text('Нарисовать')
              ),
            ),
          ),
          SizedBox(height: 12),
          Text('Предложенные фигуры', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ['Сердце', 'Звезда', 'Смайлик', 'Единорог', 'Кошка', 'Какашка']
                .map((t) => ChoiceChip(
                label: Text(t),
                selected: false,
                onSelected: (_) => _pickTemplate(context, t)
            )).toList(),
          ),
          SizedBox(height: 12),
          Text('История работ', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          ...List.generate(3, (i) => Card(
              child: ListTile(
                leading: Icon(Icons.map),
                title: Text('Рисунок ${i+1}'),
                subtitle: Text('Длина: ${2 + i*3} km • Точки: ${(i+1)*10}'),
                trailing: IconButton(icon: Icon(Icons.share), onPressed: () {}),
              )
          ))
        ],
      ),
    );
  }

  void _drawManual(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => DrawRouteScreen(manual: true))
    );
  }

  void _pickTemplate(BuildContext context, String name) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Выбрана шаблон-фигура: $name'))
    );
  }

  void _openCompetitions(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => CompetitionsScreen())
    );
  }
}