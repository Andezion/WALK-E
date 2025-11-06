// lib/features/transport/screens/report_problem_screen.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ReportProblemScreen extends StatefulWidget {
  @override
  _ReportProblemScreenState createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState extends State<ReportProblemScreen> {
  final desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Сообщить о проблеме')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
            children: [
              TextField(
                  controller: desc,
                  decoration: InputDecoration(labelText: 'Описание проблемы')
              ),
              SizedBox(height: 12),
              OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.photo_camera),
                  label: Text('Прикрепить фото (UI)')
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: _send,
                  child: Text('Отправить'),
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

  void _send() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Проблема отправлена • +10 Eco Points (симуляция)'))
    );
  }
}