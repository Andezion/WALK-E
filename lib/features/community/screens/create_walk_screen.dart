import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class CreateWalkScreen extends StatefulWidget {
  const CreateWalkScreen({super.key});

  @override
  _CreateWalkScreenState createState() => _CreateWalkScreenState();
}

class _CreateWalkScreenState extends State<CreateWalkScreen> {
  final _title = TextEditingController();
  Duration _duration = Duration(minutes: 30);
  bool _requiresApproval = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create a walk')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
            children: [
              TextField(
                  controller: _title,
                  decoration: InputDecoration(labelText: 'Title')
              ),
              SizedBox(height: 8),
              Row(
                  children: [
                    Text('Duration: ${_duration.inMinutes} min'),
                    Spacer(),
                    IconButton(
                        onPressed: () => setState(() => _duration += Duration(minutes: 10)),
                        icon: Icon(Icons.add)
                    ),
                    IconButton(
                        onPressed: () => setState(() => _duration -= Duration(minutes: 10)),
                        icon: Icon(Icons.remove)
                    ),
                  ]
              ),
              SwitchListTile(
                  title: Text('Confirmation required'),
                  value: _requiresApproval,
                  onChanged: (v) => setState(() => _requiresApproval = v)
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: _create,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      minimumSize: Size.fromHeight(48)
                  ),
                  child: Text('Create')
              ),
            ]
        ),
      ),
    );
  }

  void _create() {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('A walk is created (UI only)'))
    );
  }
}