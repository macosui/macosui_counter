import 'package:flutter/material.dart';
import 'package:macosui_counter/apps/windows_app.dart';
import 'package:macosui_counter/bloc/counter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  final counterBloc = CounterBloc();
  runApp(
    MultiProvider(
      providers: [
        Provider<CounterBloc>.value(value: counterBloc),
      ],
      child: const WindowsApp(),
    ),
  );
}