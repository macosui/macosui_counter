import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:macosui_counter/ui/screens/desktop_counter.dart';

/// A root widget appropriate for macOS/desktop
class MacApp extends StatelessWidget {
  const MacApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosApp(
      debugShowCheckedModeBanner: false,
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark(),
      home: DesktopCounter(),
    );
  }
}
