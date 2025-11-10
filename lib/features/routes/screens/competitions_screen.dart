import 'package:flutter/material.dart';

class CompetitionsScreen extends StatelessWidget {
  const CompetitionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Contests')),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Card(
                child: ListTile(
                    title: Text('Figure of the month'),
                    subtitle: Text('Best Drawings - Awards')
                )
            ),
            Card(
                child: ListTile(
                    title: Text('Night circuit'),
                    subtitle: Text('Marathon 5 км')
                )
            ),
          ],
        )
    );
  }
}