import 'package:flutter/material.dart';
import 'package:macosui_counter/state/counter_bloc.dart';
import 'package:provider/provider.dart';

class MobileCounterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.add),
          onPressed: () =>
              Provider.of<CounterBloc>(context, listen: false).increment(),
        ),
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.remove),
          onPressed: () =>
              Provider.of<CounterBloc>(context, listen: false).decrement(),
        ),
      ],
    );
  }
}
