import 'package:macos_ui/macos_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:macosui_counter/bloc/settings_bloc.dart';
import 'package:macosui_counter/ui/counter_shell.dart';
import 'package:provider/provider.dart';

/// A root widget appropriate for macOS/desktop
class MacApp extends StatelessWidget {
  const MacApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Settings>(
      stream: Provider.of<SettingsBloc>(context).preferencesSubject,
      initialData: Provider.of<SettingsBloc>(context).preferencesSubject.value,
      builder: (context, snapshot) {
        return MacosApp(
          debugShowCheckedModeBanner: false,
          themeMode: snapshot.data!.themeMode,
          home: CounterShell(),
        );
      }
    );
  }
}
