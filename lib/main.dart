import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart'; // assuming App is in app.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const App());
}
