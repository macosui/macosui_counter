import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:macosui_counter/bloc/counter_bloc.dart';
import 'package:provider/provider.dart';

class DesktopCounterButtons extends StatelessWidget {
  const DesktopCounterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PushButton(
          controlSize: ControlSize.large,
          onPressed: () =>
              Provider.of<CounterBloc>(context, listen: false).decrement(),
          child: const Text('Decrement'),
        ),
        const SizedBox(width: 16.0),
        PushButton(
          controlSize: ControlSize.large,
          onPressed: () =>
              Provider.of<CounterBloc>(context, listen: false).increment(),
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
