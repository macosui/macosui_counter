import 'package:flutter/material.dart';
import 'package:macosui_counter/ui/widgets/counter_output.dart';
import 'package:macosui_counter/ui/widgets/mobile_counter_buttons.dart';

class MobileCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            CounterOutput(),
          ],
        ),
      ),
      floatingActionButton: MobileCounterButtons(),
    );
  }
}
