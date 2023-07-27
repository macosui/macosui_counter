import 'package:flutter/material.dart';
import 'package:macosui_counter/ui/screens/mobile_counter.dart';

/// A root widget appropriate for Android/iOS
class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'macos_ui Counter Demo',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        colorScheme: const ColorScheme.dark().copyWith(
          secondary: Colors.indigoAccent,
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const MobileCounter(),
      debugShowCheckedModeBanner: false,
    );
  }
}
