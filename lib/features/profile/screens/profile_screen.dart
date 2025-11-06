// lib/features/profile/screens/profile_screen.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'settings_screen.dart';
import 'customization_screen.dart';
import '../../auth/screens/auth_gate_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => SettingsScreen())
              )
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(
              child: CircleAvatar(
                  radius: 44,
                  backgroundColor: AppColors.accent,
                  child: Icon(Icons.person, color: Colors.white, size: 44)
              )
          ),
          SizedBox(height: 8),
          Center(
              child: Text('Влад', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ),
          SizedBox(height: 12),
          Card(child: ListTile(title: Text('Eco Points'), trailing: Text('1250'))),
          Card(child: ListTile(title: Text('Уровень'), trailing: Text('8'))),
          Card(
              child: ListTile(
                title: Text('Кастомизация'),
                subtitle: Text('Фоны, рамки, значки'),
                trailing: ElevatedButton(
                    onPressed: () => _openCustomization(context),
                    child: Text('Открыть')
                ),
              )
          ),
          Card(
              child: ListTile(
                  title: Text('Connected devices'),
                  subtitle: Text('Не подключено'),
                  trailing: Icon(Icons.chevron_right)
              )
          ),
          Card(
              child: ListTile(
                  title: Text('История eco points'),
                  trailing: Icon(Icons.chevron_right)
              )
          ),
          SizedBox(height: 12),
          ElevatedButton.icon(
              onPressed: () => _logout(context),
              icon: Icon(Icons.logout),
              label: Text('Выйти'),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.dark)
          ),
        ],
      ),
    );
  }

  void _openCustomization(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => CustomizationScreen())
    );
  }

  void _logout(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => AuthGateScreen())
    );
  }
}