import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:universal_platform/universal_platform.dart';

class CounterText extends StatelessWidget {
  const CounterText({Key? key, required this.count}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isDesktop || UniversalPlatform.isWeb) {
      return Text(
        '$count',
        style: MacosTheme.of(context).typography.largeTitle,
      );
    } else {
      return Text(
        '$count',
        style: Theme.of(context).textTheme.headline4,
      );
    }
  }
}
