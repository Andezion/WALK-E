import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class RewardsScreen extends StatelessWidget {
  final List<RewardItem> rewards = [
    RewardItem(
      title: 'A bike for 20 minutes',
      icon: Icons.directions_bike,
      cost: 50,
      description: '20 minutes free on a bike! Choose your ride around the city!',
      color: Colors.blue,
    ),
    RewardItem(
      title: 'Discount on bicycle rentals',
      icon: Icons.pedal_bike,
      cost: 70,
      description: 'Get a 30% discount on renting a bike for an hour',
      color: Colors.orange,
    ),
    RewardItem(
      title: 'A ticket to the theater',
      icon: Icons.theater_comedy,
      cost: 350,
      description: 'Free ticket to the city theater for any performance',
      color: Colors.purple,
    ),
    RewardItem(
      title: 'Scooter for 30 minutes',
      icon: Icons.electric_scooter,
      cost: 150,
      description: 'Free electric scooter ride for 30 minutes',
      color: Colors.green,
    ),
    RewardItem(
      title: '20% off at the cafe',
      icon: Icons.local_cafe,
      cost: 130,
      description: '20% discount in partner cafes of the city',
      color: Colors.brown,
    ),
    RewardItem(
      title: 'Museum subscription',
      icon: Icons.museum,
      cost: 500,
      description: 'Monthly pass to all city museums',
      color: Colors.indigo,
    ),
    RewardItem(
      title: 'Bike for an hour',
      icon: Icons.directions_bike,
      cost: 75,
      description: '60 minutes of free cycling',
      color: Colors.teal,
    ),
    RewardItem(
      title: 'Bus for the day',
      icon: Icons.directions_bus,
      cost: 150,
      description: 'Unlimited bus rides during the day',
      color: Colors.red,
    ),
  ];

  RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.bgGradient),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: rewards.length,
                  itemBuilder: (context, index) {
                    return _buildRewardCard(context, rewards[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Rewards',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.eco, color: Colors.white, size: 18),
                SizedBox(width: 6),
                Text(
                  '1,250',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardCard(BuildContext context, RewardItem reward) {
    return GestureDetector(
      onTap: () => _showRewardDetails(context, reward),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: reward.color.withOpacity(0.2),
              blurRadius: 15,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: reward.color.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: reward.color.withOpacity(0.3),
                  width: 3,
                ),
              ),
              child: Center(
                child: Icon(
                  reward.icon,
                  size: 40,
                  color: reward.color,
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                reward.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark,
                  height: 1.2,
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: reward.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${reward.cost}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: reward.color,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.eco,
                    size: 16,
                    color: reward.color,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRewardDetails(BuildContext context, RewardItem reward) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: reward.color.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: reward.color.withOpacity(0.3),
                  width: 3,
                ),
              ),
              child: Center(
                child: Icon(
                  reward.icon,
                  size: 50,
                  color: reward.color,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              reward.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.dark,
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: reward.color.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                reward.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.dark.withOpacity(0.7),
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: reward.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Cost',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.dark.withOpacity(0.6),
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${reward.cost}',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: reward.color,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.eco, color: reward.color, size: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'You have',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.dark.withOpacity(0.6),
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '1,250',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.eco, color: Colors.green, size: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [reward.color, reward.color.withOpacity(0.8)],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: reward.color.withOpacity(0.4),
                    blurRadius: 15,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _purchaseReward(context, reward);
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Center(
                    child: Text(
                      'Exchange',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _purchaseReward(BuildContext context, RewardItem reward) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 28),
            SizedBox(width: 12),
            Text('Success!'),
          ],
        ),
        content: Text(
          'Reward "${reward.title}" received! Check your email for details.',
          style: TextStyle(fontSize: 15),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'ОК',
              style: TextStyle(
                color: AppColors.accent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RewardItem {
  final String title;
  final IconData icon;
  final int cost;
  final String description;
  final Color color;

  RewardItem({
    required this.title,
    required this.icon,
    required this.cost,
    required this.description,
    required this.color,
  });
}