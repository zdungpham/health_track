import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'package:health_tracker/database_helper.dart';
import 'package:intl/intl.dart';

class StepCounterScreen extends StatefulWidget {
  const StepCounterScreen({super.key});

  @override
  _StepCounterScreenState createState() => _StepCounterScreenState();
}

class _StepCounterScreenState extends State<StepCounterScreen> {
  String _stepCountValue = '0';
  late Stream<StepCount> _stepCountStream;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    requestPermissions();
    startListening();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> requestPermissions() async {
    PermissionStatus status = await Permission.activityRecognition.request();

    if (status.isGranted) {
      startListening();
    } else if (status.isDenied) {
      setState(() {
        _stepCountValue = 'Permission Denied';
      });
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void startListening() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
  }

  void onStepCount(StepCount event) {
    setState(() {
      _stepCountValue = event.steps.toString();
    });
    saveStepCount(event.steps);
  }

  void onStepCountError(error) {
    print('Error: $error');
    setState(() {
      _stepCountValue = 'Error';
    });
  }

  void startTimer() {
    _timer = Timer.periodic(
        const Duration(seconds: 10), (Timer t) => refreshStepCount());
  }

  void refreshStepCount() {
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
  }

  Future<void> saveStepCount(int steps) async {
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final dbHelper = DatabaseHelper();
    final existingRecord = await dbHelper.getStepCountForDate(today);

    if (existingRecord != null) {
      int newStepCount = steps + (existingRecord['step_count']) as int;
      await dbHelper.insertStepCount(newStepCount, today);
    } else {
      await dbHelper.insertStepCount(steps, today);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Steps taken: $_stepCountValue',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
