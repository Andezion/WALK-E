// lib/features/community/screens/community_screen.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/filters_sheet.dart';
import 'create_walk_screen.dart';
import 'draw_route_screen.dart';

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Сообщество'),
        actions: [
          IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () => _openFilters(context)
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ElevatedButton.icon(
            onPressed: () => _createWalk(context),
            icon: Icon(Icons.add),
            label: Text('Создать прогулку'),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent),
          ),
          SizedBox(height: 12),
          Text('Доступные сейчас прогулки', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          ...List.generate(3, (i) => Card(
            child: ListTile(
              leading: CircleAvatar(
                  backgroundColor: AppColors.accent,
                  child: Icon(Icons.directions_walk, color: Colors.white)
              ),
              title: Text('Вечерняя прогулка в парке ${i+1}'),
              subtitle: Text('3.2 км • 18:30 • ${5+i} участн.'),
              trailing: ElevatedButton(
                  onPressed: () => _joinWalk(context),
                  child: Text('Присоединиться')
              ),
            ),
          )),
          SizedBox(height: 12),
          Text('Опции рисования маршрутов', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () => _drawOwn(context),
                        child: Text('Нарисовать свой')
                    )
                ),
                SizedBox(width: 8),
                Expanded(
                    child: OutlinedButton(
                        onPressed: () => _drawFromTemplates(context),
                        child: Text('Из предложенных')
                    )
                ),
              ]
          ),
          SizedBox(height: 12),
          Text('Галерея шаговых рисунков', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, idx) => _galleryItem(idx),
              separatorBuilder: (_, __) => SizedBox(width: 12),
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _galleryItem(int idx) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
            colors: [AppColors.accent.withOpacity(0.9), AppColors.deep.withOpacity(0.9)]
        ),
      ),
      child: Center(
          child: Text(
              'Рисунок ${idx+1}',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
          )
      ),
    );
  }

  void _openFilters(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) => FiltersSheet());
  }

  void _createWalk(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => CreateWalkScreen()));
  }

  void _joinWalk(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Запрос на присоединение отправлен (UI only)'))
    );
  }

  void _drawOwn(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DrawRouteScreen(manual: true)));
  }

  void _drawFromTemplates(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DrawRouteScreen(manual: false)));
  }
}