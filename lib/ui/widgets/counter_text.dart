import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:universal_platform/universal_platform.dart';

class CounterText extends StatelessWidget {
  const CounterText({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    // TODO: other platform implementations
    if (UniversalPlatform.isMacOS) {
      return Text(
        '$count',
        style: MacosTheme.of(context).typography.largeTitle,
      );
    } else if (UniversalPlatform.isWindows) {
      return Text(
        '$count',
        style: FluentTheme.of(context).typography.title,
      );
    } else {
      return Text(
        '$count',
        style: Theme.of(context).textTheme.headlineMedium,
      );
    }
  }
}
