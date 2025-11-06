import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_constants.dart';

class TemplateChips extends StatefulWidget {
  final Function(String) onTemplateSelected;

  const TemplateChips({super.key, required this.onTemplateSelected});

  @override
  _TemplateChipsState createState() => _TemplateChipsState();
}

class _TemplateChipsState extends State<TemplateChips> {
  String? selectedTemplate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Предложенные фигуры',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16
            )
        ),
        SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: AppConstants.drawingTemplates.map((template) {
            final isSelected = selectedTemplate == template;
            return ChoiceChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _getTemplateIcon(template),
                  SizedBox(width: 6),
                  Text(template),
                ],
              ),
              selected: isSelected,
              selectedColor: AppColors.accent,
              backgroundColor: AppColors.light,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : AppColors.dark,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              onSelected: (selected) {
                setState(() {
                  selectedTemplate = selected ? template : null;
                });
                if (selected) {
                  widget.onTemplateSelected(template);
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _getTemplateIcon(String template) {
    IconData icon;
    switch (template) {
      case 'Сердце':
        icon = Icons.favorite;
        break;
      case 'Звезда':
        icon = Icons.star;
        break;
      case 'Смайлик':
        icon = Icons.emoji_emotions;
        break;
      case 'Единорог':
        icon = Icons.pets;
        break;
      case 'Кошка':
        icon = Icons.pets;
        break;
      case 'Какашка':
        icon = Icons.emoji_emotions_outlined;
        break;
      default:
        icon = Icons.route;
    }
    return Icon(icon, size: 16);
  }
}