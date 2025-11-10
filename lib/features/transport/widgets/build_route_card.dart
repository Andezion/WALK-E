import 'package:flutter/material.dart';

class BuildRouteCard extends StatelessWidget {
  const BuildRouteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Build a route', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              TextField(
                  decoration: InputDecoration(
                      hintText: 'From',
                      prefixIcon: Icon(Icons.location_on)
                  )
              ),
              SizedBox(height: 8),
              TextField(
                  decoration: InputDecoration(
                      hintText: 'To',
                      prefixIcon: Icon(Icons.flag)
                  )
              ),
              SizedBox(height: 12),
              Row(
                  children: [
                    ElevatedButton(
                        onPressed: () => _buildRoute(context),
                        child: Text('Build')
                    ),
                    SizedBox(width: 8),
                    OutlinedButton(
                        onPressed: () => _openTransportHub(context),
                        child: Text('Show hubs')
                    ),
                  ]
              )
            ]
        ),
      ),
    );
  }

  void _buildRoute(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Route is built (UI simulation)'))
    );
  }

  void _openTransportHub(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Hubs in the city'),
          content: Text('Hub and station list (UI only)'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close')
            )
          ],
        )
    );
  }
}