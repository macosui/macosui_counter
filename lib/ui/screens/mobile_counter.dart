import 'package:flutter/material.dart';
import 'package:macosui_counter/ui/widgets/counter_output.dart';
import 'package:macosui_counter/ui/widgets/info_text.dart';
import 'package:macosui_counter/ui/widgets/mobile_counter_buttons.dart';

class MobileCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => _MobileInfoDialog(),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            CounterOutput(),
          ],
        ),
      ),
      floatingActionButton: MobileCounterButtons(),
    );
  }
}

class _MobileInfoDialog extends StatelessWidget {
  const _MobileInfoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Info'),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: const InfoText(),
        ),
        ButtonBar(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Theme.of(context).colorScheme.secondary,
              ),
              child: const Text('DISMISS'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ],
    );
  }
}
