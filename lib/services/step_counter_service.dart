import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StepCounterService {
  static final StepCounterService _instance = StepCounterService._internal();
  factory StepCounterService() => _instance;
  StepCounterService._internal();

  StreamSubscription<StepCount>? _stepCountSubscription;
  StreamSubscription<PedestrianStatus>? _pedestrianStatusSubscription;

  int _todaySteps = 0;
  int _totalSteps = 0;
  String _lastSavedDate = '';
  bool _isWalking = false;

  int get todaySteps => _todaySteps;
  int get totalSteps => _totalSteps;
  bool get isWalking => _isWalking;

  final _stepsController = StreamController<int>.broadcast();
  Stream<int> get stepsStream => _stepsController.stream;

  final _walkingController = StreamController<bool>.broadcast();
  Stream<bool> get walkingStream => _walkingController.stream;

  Future<void> initialize() async {
    await _loadSavedData();
    await _checkAndResetDaily();
    await _requestPermissions();
    await _startListening();
  }

  Future<void> _requestPermissions() async {
    if (await Permission.activityRecognition.isDenied) {
      await Permission.activityRecognition.request();
    }

    if (await Permission.sensors.isDenied) {
      await Permission.sensors.request();
    }
  }

  Future<void> _startListening() async {
    try {
      _stepCountSubscription = Pedometer.stepCountStream.listen(
        _onStepCount,
        onError: _onStepCountError,
      );

      _pedestrianStatusSubscription = Pedometer.pedestrianStatusStream.listen(
        _onPedestrianStatusChanged,
        onError: _onPedestrianStatusError,
      );
    } catch (e) {
      print('Error starting pedometer: $e');
    }
  }

  void _onStepCount(StepCount event) async {
    final prefs = await SharedPreferences.getInstance();
    final savedSteps = prefs.getInt('initial_steps') ?? 0;

    if (savedSteps == 0) {
      await prefs.setInt('initial_steps', event.steps);
      _todaySteps = 0;
    } else {
      _todaySteps = event.steps - savedSteps;
    }

    _totalSteps = event.steps;

    await _saveData();

    _stepsController.add(_todaySteps);
  }

  void _onPedestrianStatusChanged(PedestrianStatus event) {
    _isWalking = event.status == 'walking';
    _walkingController.add(_isWalking);
  }

  void _onStepCountError(error) {
    print('Step Count Error: $error');
  }

  void _onPedestrianStatusError(error) {
    print('Pedestrian Status Error: $error');
  }

  Future<void> _checkAndResetDaily() async {
    final now = DateTime.now();
    final today = '${now.year}-${now.month}-${now.day}';

    if (_lastSavedDate != today) {
      print('New day detected! Resetting steps.');
      _todaySteps = 0;
      _lastSavedDate = today;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('initial_steps', _totalSteps);
      await prefs.setString('last_date', today);

      _stepsController.add(_todaySteps);
    }
  }

  Future<void> _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    _lastSavedDate = prefs.getString('last_date') ?? '';
    _todaySteps = prefs.getInt('today_steps') ?? 0;
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('today_steps', _todaySteps);
    final now = DateTime.now();
    await prefs.setString('last_date', '${now.year}-${now.month}-${now.day}');
  }

  int getCalories() {
    return (_todaySteps * 0.04).round();
  }

  double getDistanceKm() {
    return (_todaySteps * 0.000762);
  }

  void dispose() {
    _stepCountSubscription?.cancel();
    _pedestrianStatusSubscription?.cancel();
    _stepsController.close();
    _walkingController.close();
  }
}