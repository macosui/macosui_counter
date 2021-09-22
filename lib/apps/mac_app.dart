import 'package:macos_ui/macos_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:macosui_counter/ui/counter_shell.dart';

/// A root widget appropriate for macOS/desktop
class MacApp extends StatelessWidget {
  const MacApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosApp(
      debugShowCheckedModeBanner: false,
      home: CounterShell(),
    );
  }
}
