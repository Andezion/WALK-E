import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../profile/screens/profile_screen.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Row(
          children: [
            CircleAvatar(
                radius: 34,
                backgroundColor: AppColors.accent,
                child: Icon(Icons.person, color: Colors.white, size: 36)
            ),
            SizedBox(width: 12),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Vlad', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text('Sprouts: 1 250', style: TextStyle(color: AppColors.dark)),
                    SizedBox(height: 6),
                    LinearProgressIndicator(
                        value: 0.6,
                        color: AppColors.accent,
                        backgroundColor: AppColors.dark.withOpacity(0.08)
                    ),
                  ],
                )
            ),
            IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ProfileScreen())
                ),
                icon: Icon(Icons.chevron_right)
            )
          ],
        ),
      ),
    );
  }
}