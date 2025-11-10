import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class FiltersSheet extends StatefulWidget {
  const FiltersSheet({super.key});

  @override
  _FiltersSheetState createState() => _FiltersSheetState();
}

class _FiltersSheetState extends State<FiltersSheet> {
  bool friends = false;
  bool accessible = false;
  RangeValues distance = RangeValues(0, 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      padding: EdgeInsets.all(24),
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
          SizedBox(height: 20),
          Text(
            'Filters',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.dark,
            ),
          ),
          SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
            ),
            child: SwitchListTile(
              value: friends,
              onChanged: (v) => setState(() => friends = v),
              title: Text(
                'Just friends',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark,
                ),
              ),
              subtitle: Text(
                'Only show walks from friends',
                style: TextStyle(fontSize: 12),
              ),
              activeColor: AppColors.accent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
            ),
            child: SwitchListTile(
              value: accessible,
              onChanged: (v) => setState(() => accessible = v),
              title: Text(
                'Available routes',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark,
                ),
              ),
              subtitle: Text(
                'For disabled persons/wheelchair',
                style: TextStyle(fontSize: 12),
              ),
              activeColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Maximum distance',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.dark,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '${distance.start.round()} - ${distance.end.round()} км',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 8),
                RangeSlider(
                  values: distance,
                  min: 0,
                  max: 50,
                  divisions: 10,
                  activeColor: Colors.orange,
                  inactiveColor: Colors.orange.withOpacity(0.2),
                  onChanged: (v) => setState(() => distance = v),
                  labels: RangeLabels(
                    '${distance.start.round()} km',
                    '${distance.end.round()} km',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      friends = false;
                      accessible = false;
                      distance = RangeValues(0, 10);
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.dark.withOpacity(0.3)),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      color: AppColors.dark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}