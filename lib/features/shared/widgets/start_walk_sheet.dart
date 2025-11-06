// lib/features/shared/widgets/start_walk_sheet.dart
import 'package:flutter/material.dart';

class StartWalkSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 18, 16, 24),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('Начать прогулку', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Row(children: [
          Expanded(child: OutlinedButton(onPressed: () => _start(context, 'Пешком'), child: Text('Пешком'))),
          SizedBox(width: 8),
          Expanded(child: OutlinedButton(onPressed: () => _start(context, 'Бег'), child: Text('Бег'))),
        ]),
        SizedBox(height: 8),
        Row(children: [
          Expanded(child: OutlinedButton(onPressed: () => _start(context, 'Велосипед'), child: Text('Велосипед'))),
          SizedBox(width: 8),
          Expanded(child: OutlinedButton(onPressed: () => _start(context, 'Самокат'), child: Text('Самокат'))),
        ]),
      ]),
    );
  }

  void _start(BuildContext ctx, String mode) {
    Navigator.of(ctx).pop();
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text('Запущен режим: $mode (UI only)')));
  }
}