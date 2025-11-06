import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Настройки')),
        body: ListView(
            padding: EdgeInsets.all(16),
            children: [
              ListTile(
                  title: Text('Язык'),
                  subtitle: Text('Русский / Polski / English'),
                  trailing: Icon(Icons.chevron_right)
              ),
              SwitchListTile(
                  title: Text('Уведомления'),
                  value: true,
                  onChanged: (_) {}
              ),
              ListTile(
                  title: Text('Единицы'),
                  subtitle: Text('Килограммы / Километры')
              ),
              ListTile(
                  title: Text('Приватность'),
                  subtitle: Text('Настройки приватности и фильтры')
              ),
            ]
        )
    );
  }
}