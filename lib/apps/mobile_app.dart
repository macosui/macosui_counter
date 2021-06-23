import 'package:flutter/material.dart';
import 'package:macosui_counter/ui/counter_shell.dart';

/// A root widget appropriate for Android/iOS
class MobileApp extends StatelessWidget {
  const MobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'macos_ui Counter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent,
      ),
      home: CounterShell(),
    );
  }
}
