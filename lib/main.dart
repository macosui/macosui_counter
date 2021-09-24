import 'package:flutter/material.dart';
import 'package:macosui_counter/bloc/counter_bloc.dart';
import 'package:macosui_counter/bloc/settings_bloc.dart';
import 'package:macosui_counter/platform_delegate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settingsBloc = await SettingsBloc.init();
  final counterBloc = CounterBloc();

  runApp(
    PlatformDelegate(
      settingsBloc: settingsBloc,
      counterBloc: counterBloc,
    ),
  );
}
