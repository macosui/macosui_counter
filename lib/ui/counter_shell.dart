import 'package:flutter/material.dart';
import 'package:macosui_counter/ui/screens/desktop_counter.dart';
import 'package:macosui_counter/ui/screens/mobile_counter.dart';
import 'package:universal_platform/universal_platform.dart';

class CounterShell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isDesktopOrWeb) {
      return DesktopCounter();
    } else {
      return MobileCounter();
    }
  }
}
