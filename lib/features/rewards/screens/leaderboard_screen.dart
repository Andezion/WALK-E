import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Таблица лидеров')),
        body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: 10,
          itemBuilder: (_, i) => Card(
              child: ListTile(
                  leading: CircleAvatar(child: Text('${i+1}')),
                  title: Text('Пользователь ${i+1}'),
                  subtitle: Text('${2000 - i*100} Eco Points')
              )
          ),
        )
    );
  }
}