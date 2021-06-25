import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:macosui_counter/bloc/counter_bloc.dart';
import 'package:provider/provider.dart';

class DesktopCounterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PushButton(
          child: Text('Decrement'),
          buttonSize: ButtonSize.large,
          onPressed: () =>
              Provider.of<CounterBloc>(context, listen: false).decrement(),
        ),
        const SizedBox(width: 16.0),
        PushButton(
          child: Text('Increment'),
          buttonSize: ButtonSize.large,
          onPressed: () =>
              Provider.of<CounterBloc>(context, listen: false).increment(),
        ),
      ],
    );
  }
}
