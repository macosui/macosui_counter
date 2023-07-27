import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:macosui_counter/ui/screens/macos_counter.dart';

/// A root widget appropriate for macOS/desktop
class MacApp extends StatelessWidget {
  const MacApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosApp(
      debugShowCheckedModeBanner: false,
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const MacosCounter(),
    );
  }
}
