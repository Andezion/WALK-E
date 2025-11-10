import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Settings')),
        body: ListView(
            padding: EdgeInsets.all(16),
            children: [
              ListTile(
                  title: Text('Lang'),
                  subtitle: Text('Русский / Polski / English'),
                  trailing: Icon(Icons.chevron_right)
              ),
              SwitchListTile(
                  title: Text('Notifications'),
                  value: true,
                  onChanged: (_) {}
              ),
              ListTile(
                  title: Text('Units'),
                  subtitle: Text('Kilograms / Kilometers')
              ),
              ListTile(
                  title: Text('Privacy'),
                  subtitle: Text('Privacy settings and filters')
              ),
            ]
        )
    );
  }
}