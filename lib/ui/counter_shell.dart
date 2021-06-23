import 'package:flutter/material.dart';
import 'package:macosui_counter/ui/screens/desktop_counter.dart';
import 'package:macosui_counter/ui/screens/mobile_counter.dart';
import 'package:universal_platform/universal_platform.dart';

/// A wrapper that builds the desktop or mobile versions of the counter functionality.
class CounterShell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isDesktop || UniversalPlatform.isWeb) {
      return DesktopCounter();
    } else {
      return MobileCounter();
    }
  }
}
