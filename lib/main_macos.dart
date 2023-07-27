import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:macosui_counter/apps/mac_app.dart';
import 'package:macosui_counter/bloc/counter_bloc.dart';
import 'package:provider/provider.dart';

Future<void> _configureMacosWindowUtils() async {
  const config = MacosWindowUtilsConfig();
  await config.apply();
}

Future<void> main() async {
  final counterBloc = CounterBloc();
  if (!kIsWeb) {
    if (Platform.isMacOS) {
      await _configureMacosWindowUtils();
    }
  }

  runApp(
    MultiProvider(
      providers: [
        Provider<CounterBloc>.value(value: counterBloc),
      ],
      child: const MacApp(),
    ),
  );
}