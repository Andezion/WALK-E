import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../home/screens/home_screen.dart';
import '../../community/screens/community_screen.dart';
import '../../transport/screens/transport_screen.dart';
import '../../routes/screens/routes_screen.dart';
import '../../rewards/screens/rewards_screen.dart';
import '../../profile/screens/profile_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

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
    RewardsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, -5),
            ),
          ],
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomNavigationBar(
            currentIndex: _index,
            selectedItemColor: AppColors.accent,
            unselectedItemColor: AppColors.dark.withOpacity(0.4),
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedFontSize: 11,
            unselectedFontSize: 10,
            onTap: (i) => setState(() => _index = i),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded, size: 24),
                label: 'Main',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group_rounded, size: 24),
                label: 'Community',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.directions_transit_rounded, size: 24),
                label: 'Transport',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map_rounded, size: 24),
                label: 'Routes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard_rounded, size: 24),
                label: 'Rewards',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded, size: 24),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}