// lib/features/rewards/screens/rewards_screen.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class RewardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Награды')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('Доступные награды', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          ...List.generate(4, (i) => Card(
              child: ListTile(
                leading: Icon(Icons.card_giftcard, color: AppColors.accent),
                title: Text('Скидка ${5 + i*5}% в кафе'),
                subtitle: Text('Стоимость: ${(i+1)*300} Eco Points'),
                trailing: ElevatedButton(
                    onPressed: () => _purchase(context, i),
                    child: Text('Обменять')
                ),
              )
          )),
          SizedBox(height: 12),
          Text('Награды на которые можно накопить', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          ...List.generate(2, (i) => ListTile(
            title: Text('Абонемент на велопрокат'),
            subtitle: LinearProgressIndicator(
                value: 0.4 + i*0.1,
                color: AppColors.accent
            ),
            trailing: Text('${(40 + i*10)}%'),
          ))
        ],
      ),
    );
  }

  void _purchase(BuildContext context, int i) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Вы уверены?'),
          content: Text('Поменять Eco Points на награду (UI only).'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Отмена')
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Награда получена (симуляция)'))
                  );
                },
                child: Text('OK')
            )
          ],
        )
    );
  }
}