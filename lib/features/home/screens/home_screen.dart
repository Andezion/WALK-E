import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/profile_header.dart';
import '../widgets/activity_card.dart';
import '../widgets/daily_task_card.dart';
import '../widgets/quick_stats_card.dart';
import '../../rewards/screens/rewards_screen.dart';
import '../../rewards/screens/leaderboard_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Главная'),
        actions: [
          IconButton(onPressed: () => _openRewards(context), icon: Icon(Icons.card_giftcard)),
          IconButton(onPressed: () => _openLeaderboard(context), icon: Icon(Icons.leaderboard)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            ProfileHeader(),
            SizedBox(height: 16),
            ActivityCard(),
            SizedBox(height: 12),
            DailyTaskCard(),
            SizedBox(height: 12),
            QuickStatsCard(),
            SizedBox(height: 20),
            Text('История активностей', style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            ...List.generate(4, (i) => ListTile(
              leading: Icon(Icons.check_circle, color: AppColors.accent),
              title: Text('Прогулка • ${10 + i} мин'),
              subtitle: Text('+${(i+1)*10} Eco Points'),
              trailing: Text('ур. ${(i%3)+1}'),
            ))
          ],
        ),
      ),
    );
  }

  void _openRewards(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => RewardsScreen()));
  }

  void _openLeaderboard(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => LeaderboardScreen()));
  }
}