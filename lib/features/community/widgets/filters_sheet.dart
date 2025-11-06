// lib/features/community/widgets/filters_sheet.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class FiltersSheet extends StatefulWidget {
  @override
  _FiltersSheetState createState() => _FiltersSheetState();
}

class _FiltersSheetState extends State<FiltersSheet> {
  bool friends = false;
  bool accessible = false;
  RangeValues distance = RangeValues(0, 10);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Фильтры', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SwitchListTile(
                  value: friends,
                  onChanged: (v) => setState(() => friends = v),
                  title: Text('Только друзья')
              ),
              SwitchListTile(
                  value: accessible,
                  onChanged: (v) => setState(() => accessible = v),
                  title: Text('Маршруты для инвалидов/с коляской')
              ),
              SizedBox(height: 8),
              Text('Макс. расстояние (км)'),
              RangeSlider(
                  values: distance,
                  min: 0,
                  max: 50,
                  divisions: 10,
                  onChanged: (v) => setState(() => distance = v)
              ),
              SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Применить'),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent)
              )
            ]
        )
    );
  }
}