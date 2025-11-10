import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class AuthCard extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onSubmit;
  final VoidCallback onToggleMode;

  const AuthCard({super.key,
    required this.isLogin,
    required this.onSubmit,
    required this.onToggleMode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.95),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: AppColors.accent,
              child: Icon(Icons.directions_walk, color: Colors.white, size: 36),
            ),
            SizedBox(height: 12),
            Text('WALK-E', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              isLogin ? 'Sign in' : 'Register',
              style: TextStyle(color: AppColors.dark),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email)
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock)
              ),
              obscureText: true,
            ),
            SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                minimumSize: Size.fromHeight(48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: onSubmit,
              child: Text(isLogin ? 'Sign in' : 'Register'),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: onToggleMode,
              child: Text(
                  isLogin
                      ? 'No account? Sign up'
                      : 'Already have an account? Sign in'
              ),
            )
          ],
        ),
      ),
    );
  }
}