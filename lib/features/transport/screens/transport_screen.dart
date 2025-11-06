// lib/features/transport/screens/transport_screen.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/build_route_card.dart';
import '../widgets/map_placeholder.dart';
import 'scooter_detail_screen.dart';
import 'report_problem_screen.dart';

class TransportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Транспорт / Хаб'),
        actions: [
          IconButton(
              onPressed: () => _reportProblem(context),
              icon: Icon(Icons.report)
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          BuildRouteCard(),
          SizedBox(height: 12),
          Text('Карта микромобильности', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          MapPlaceholder(),
          SizedBox(height: 12),
          Text('Самокаты и велосипеды рядом', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          ...List.generate(4, (i) => Card(
            child: ListTile(
              leading: Icon(Icons.electric_scooter, color: AppColors.accent),
              title: Text('Scooter #${i+1}'),
              subtitle: Text('Battery ${(40 + i*15)}% • 120 м'),
              trailing: ElevatedButton(
                  onPressed: () => _openScooter(context, i),
                  child: Text('Взять')
              ),
            ),
          ))
        ],
      ),
    );
  }

  void _reportProblem(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ReportProblemScreen())
    );
  }

  void _openScooter(BuildContext context, int i) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ScooterDetailScreen(index: i))
    );
  }
}