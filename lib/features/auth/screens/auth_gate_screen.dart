import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../shared/screens/main_shell.dart';

class AuthGateScreen extends StatefulWidget {
  const AuthGateScreen({super.key});

  @override
  _AuthGateScreenState createState() => _AuthGateScreenState();
}

class _AuthGateScreenState extends State<AuthGateScreen> {
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.bgGradient),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Card(
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
                        showLogin ? 'Войти в аккаунт' : 'Зарегистрироваться',
                        style: TextStyle(color: AppColors.dark),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(labelText: 'Пароль', prefixIcon: Icon(Icons.lock)),
                        obscureText: true,
                      ),
                      SizedBox(height: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          minimumSize: Size.fromHeight(48),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => MainShell()));
                        },
                        child: Text(showLogin ? 'Войти' : 'Зарегистрироваться'),
                      ),
                      SizedBox(height: 8),
                      TextButton(
                        onPressed: () => setState(() => showLogin = !showLogin),
                        child: Text(showLogin ? 'Нет аккаунта? Зарегистрироваться' : 'Уже есть аккаунт? Войти'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}