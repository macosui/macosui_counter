import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:macosui_counter/ui/widgets/counter_output.dart';
import 'package:macosui_counter/ui/widgets/desktop_counter_buttons.dart';

class DesktopCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You have pushed the button this many times:',
                ),
                const SizedBox(height: 8.0),
                CounterOutput(),
                const SizedBox(height: 16.0),
                DesktopCounterButtons(),
              ],
            );
          },
        ),
      ],
    );
  }
}
