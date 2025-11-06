// lib/features/shared/screens/main_shell.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../home/screens/home_screen.dart';
import '../../community/screens/community_screen.dart';
import '../../transport/screens/transport_screen.dart';
import '../../routes/screens/routes_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../widgets/start_walk_sheet.dart';

class MainShell extends StatefulWidget {
  @override
  _MainShellState createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;
  final pages = [
    HomeScreen(),
    CommunityScreen(),
    TransportScreen(),
    RoutesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.dark.withOpacity(0.6),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (i) => setState(() => _index = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_transit), label: 'Transport'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Routes'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_) => StartWalkSheet(),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))));
        },
        label: Text('Начать прогулку'),
        icon: Icon(Icons.directions_walk),
      ),
    );
  }
}