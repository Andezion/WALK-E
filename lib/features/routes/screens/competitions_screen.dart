import 'package:flutter/material.dart';

class CompetitionsScreen extends StatelessWidget {
  const CompetitionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Соревнования')),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Card(
                child: ListTile(
                    title: Text('Рисунок месяца'),
                    subtitle: Text('Лучшие рисунки • Награды')
                )
            ),
            Card(
                child: ListTile(
                    title: Text('Ночной контур'),
                    subtitle: Text('Марафон 5 км')
                )
            ),
          ],
        )
    );
  }
}