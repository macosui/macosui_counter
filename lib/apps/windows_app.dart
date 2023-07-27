import 'package:fluent_ui/fluent_ui.dart';
import 'package:macosui_counter/ui/screens/windows_counter.dart';

class WindowsApp extends StatelessWidget {
  const WindowsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'macos_ui counter demo',
      color: Colors.blue,
      darkTheme: FluentThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: const WindowsCounter(),
    );
  }
}
