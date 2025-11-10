import 'package:flutter/material.dart';

class StartWalkSheet extends StatelessWidget {
  const StartWalkSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 18, 16, 24),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('Start walking', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Row(children: [
          Expanded(child: OutlinedButton(onPressed: () => _start(context, 'On foot'), child: Text('On foot'))),
          SizedBox(width: 8),
          Expanded(child: OutlinedButton(onPressed: () => _start(context, 'Run'), child: Text('Run'))),
        ]),
        SizedBox(height: 8),
        Row(children: [
          Expanded(child: OutlinedButton(onPressed: () => _start(context, 'Bike'), child: Text('Bike'))),
          SizedBox(width: 8),
          Expanded(child: OutlinedButton(onPressed: () => _start(context, 'Scooter'), child: Text('Scooter'))),
        ]),
      ]),
    );
  }

  void _start(BuildContext ctx, String mode) {
    Navigator.of(ctx).pop();
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text('Mode started: $mode (UI only)')));
  }
}