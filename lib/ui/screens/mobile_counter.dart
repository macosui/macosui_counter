import 'package:flutter/material.dart';
import 'package:macosui_counter/ui/widgets/counter_output.dart';
import 'package:macosui_counter/ui/widgets/info_text.dart';
import 'package:macosui_counter/ui/widgets/mobile_counter_buttons.dart';

class MobileCounter extends StatelessWidget {
  const MobileCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => const _MobileInfoDialog(),
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
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const CounterOutput(),
          ],
        ),
      ),
      floatingActionButton: const MobileCounterButtons(),
    );
  }
}

class _MobileInfoDialog extends StatelessWidget {
  const _MobileInfoDialog();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Info'),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: InfoText(),
        ),
        ButtonBar(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.secondary,
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
