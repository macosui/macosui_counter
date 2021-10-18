import 'package:fluent_ui/fluent_ui.dart';
import 'package:macosui_counter/ui/screens/windows_counter.dart';

class WindowsApp extends StatelessWidget {
  const WindowsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'macos_ui counter demo',
      color: Colors.blue,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: WindowsCounter(),
    );
  }
}
