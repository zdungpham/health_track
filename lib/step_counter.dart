import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

class StepCounterScreen extends StatefulWidget {
  const StepCounterScreen({super.key});

  @override
  _StepCounterScreenState createState() => _StepCounterScreenState();
}

class _StepCounterScreenState extends State<StepCounterScreen> {
  String _stepCountValue = '0';
  late Stream<StepCount> _stepCountStream;

  @override
  void initState() {
    super.initState();
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    PermissionStatus status = await Permission.activityRecognition.request();

    if (status.isGranted) {
      startListening();
    } else if (status.isDenied) {
      // Show a message to the user that the permission was denied
      setState(() {
        _stepCountValue = 'Permission Denied';
      });
    } else if (status.isPermanentlyDenied) {
      // Show a message to the user to enable permission from settings
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
  }

  void onStepCountError(error) {
    print('Error: $error');
    setState(() {
      _stepCountValue = 'Error';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          'Steps taken: $_stepCountValue',
          style: const TextStyle(fontSize: 18),
        ),
      )
    ;
  }
}
