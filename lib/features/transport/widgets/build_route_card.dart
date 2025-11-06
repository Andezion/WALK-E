import 'package:flutter/material.dart';

class BuildRouteCard extends StatelessWidget {
  const BuildRouteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Построить маршрут', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              TextField(
                  decoration: InputDecoration(
                      hintText: 'Откуда',
                      prefixIcon: Icon(Icons.location_on)
                  )
              ),
              SizedBox(height: 8),
              TextField(
                  decoration: InputDecoration(
                      hintText: 'Куда',
                      prefixIcon: Icon(Icons.flag)
                  )
              ),
              SizedBox(height: 12),
              Row(
                  children: [
                    ElevatedButton(
                        onPressed: () => _buildRoute(context),
                        child: Text('Построить')
                    ),
                    SizedBox(width: 8),
                    OutlinedButton(
                        onPressed: () => _openTransportHub(context),
                        child: Text('Показать хабы')
                    ),
                  ]
              )
            ]
        ),
      ),
    );
  }

  void _buildRoute(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Маршрут построен (симуляция UI)'))
    );
  }

  void _openTransportHub(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Хабы в городе'),
          content: Text('Список хабов и станции (UI only)'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Закрыть')
            )
          ],
        )
    );
  }
}