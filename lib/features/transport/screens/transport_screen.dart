import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/theme/app_colors.dart';
import '../services/pathfinder.dart';
import '../widgets/scooter_list_item.dart';
import 'report_problem_screen.dart';

class TransportScreen extends StatefulWidget {
  const TransportScreen({super.key});

  @override
  _TransportScreenState createState() => _TransportScreenState();
}

class _TransportScreenState extends State<TransportScreen> {
  final LatLng centerLocation = LatLng(51.7592, 19.4560);

  final List<ScooterLocation> scooters = [
    ScooterLocation(LatLng(51.7600, 19.4570), 80, 'Scooter #1'),
    ScooterLocation(LatLng(51.7580, 19.4550), 55, 'Scooter #2'),
    ScooterLocation(LatLng(51.7610, 19.4580), 70, 'Scooter #3'),
    ScooterLocation(LatLng(51.7590, 19.4540), 85, 'Scooter #4'),
  ];
  LatLng? routeStart;
  LatLng? routeEnd;
  List<LatLng> routePoints = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.bgGradient),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    _buildRouteCard(context),
                    SizedBox(height: 24),
                    _buildSectionTitle('Micro-mobility map', Icons.map),
                    SizedBox(height: 12),
                    _buildMap(),
                    SizedBox(height: 24),
                    _buildSectionTitle(
                        'Transport nearby', Icons.electric_scooter),
                    SizedBox(height: 12),
                    ...List.generate(4, (i) => _buildScooterCard(context, i)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Transport',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () => _reportProblem(context),
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.report, color: Colors.red.shade300),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRouteCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    Icon(Icons.directions, color: AppColors.accent, size: 24),
              ),
              SizedBox(width: 12),
              Text(
                'Build a route',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.dark,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          _buildRouteInput('From', Icons.location_on, Colors.blue),
          SizedBox(height: 12),
          _buildRouteInput('To', Icons.flag, Colors.red),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _buildRoute(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Build',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _openTransportHub(context),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.accent, width: 2),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Hubs',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.accent,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRouteInput(String hint, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          SizedBox(width: 12),
          Text(
            hint,
            style: TextStyle(
              color: AppColors.dark.withOpacity(0.5),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FlutterMap(
          options: MapOptions(
            initialCenter: centerLocation,
            initialZoom: 14.0,
            minZoom: 10.0,
            maxZoom: 18.0,
            onTap: (tapPosition, latlng) {
              _onMapTap(latlng);
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.walke',
            ),
            if (routePoints.isNotEmpty)
              PolylineLayer(
                polylines: [
                  Polyline(
                      points: routePoints, color: Colors.blue, strokeWidth: 4),
                ],
              ),
            MarkerLayer(
              markers: [
                Marker(
                  point: centerLocation,
                  width: 40,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(Icons.person, color: Colors.white, size: 20),
                  ),
                ),
                ...scooters.map((scooter) => Marker(
                      point: scooter.location,
                      width: 40,
                      height: 40,
                      child: GestureDetector(
                        onTap: () => _showScooterPopup(context, scooter),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.accent,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accent.withOpacity(0.5),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Icon(Icons.electric_scooter,
                              color: Colors.white, size: 20),
                        ),
                      ),
                    )),
                if (routeStart != null)
                  Marker(
                    point: routeStart!,
                    width: 32,
                    height: 32,
                    child: Icon(Icons.my_location, color: Colors.green),
                  ),
                if (routeEnd != null)
                  Marker(
                    point: routeEnd!,
                    width: 32,
                    height: 32,
                    child: Icon(Icons.flag, color: Colors.red),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onMapTap(LatLng p) {
    setState(() {
      if (routeStart == null) {
        routeStart = p;
        routePoints = [];
      } else if (routeEnd == null) {
        routeEnd = p;

        final margin = 0.06;
        final bounds = GridBounds(
          north: centerLocation.latitude + margin,
          south: centerLocation.latitude - margin,
          west: centerLocation.longitude - margin,
          east: centerLocation.longitude + margin,
        );
        final finder = GridAStar(bounds, rows: 100, cols: 100);
        routePoints = finder.findPath(routeStart!, routeEnd!);
      } else {
        // reset
        routeStart = p;
        routeEnd = null;
        routePoints = [];
      }
    });
  }

  Widget _buildScooterCard(BuildContext context, int index) {
    final battery = 40 + index * 15;
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(Icons.electric_scooter,
                  color: AppColors.accent, size: 28),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Scooter #${index + 1}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.dark,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      _buildScooterChip(
                        Icons.battery_charging_full,
                        '$battery%',
                        _getBatteryColor(battery),
                      ),
                      SizedBox(width: 8),
                      _buildScooterChip(
                        Icons.location_on,
                        '120 m',
                        Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => _openScooter(context, index),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                'Take',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScooterChip(IconData icon, String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Color _getBatteryColor(int percent) {
    if (percent >= 60) return Colors.green;
    if (percent >= 30) return Colors.orange;
    return Colors.red;
  }

  void _showScooterPopup(BuildContext context, ScooterLocation scooter) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.electric_scooter, color: AppColors.accent),
            SizedBox(width: 12),
            Text(scooter.name),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Battery charge: ${scooter.battery}%'),
            SizedBox(height: 8),
            Text('Distance: ~150 m'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close', style: TextStyle(color: AppColors.dark)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _openScooter(context, 0);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent),
            child: Text('Take'),
          ),
        ],
      ),
    );
  }

  void _reportProblem(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => ReportProblemScreen()));
  }

  void _openScooter(BuildContext context, int i) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => ScooterDetailScreen(index: i)));
  }

  void _buildRoute(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('The route is constructed'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _openTransportHub(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.hub, color: AppColors.accent),
            SizedBox(width: 12),
            Text('Hubs in the city'),
          ],
        ),
        content: Text('List of transport hubs and stations'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: TextStyle(
                  color: AppColors.accent, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class ScooterLocation {
  final LatLng location;
  final int battery;
  final String name;

  ScooterLocation(this.location, this.battery, this.name);
}
