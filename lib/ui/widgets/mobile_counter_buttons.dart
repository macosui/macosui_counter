import 'package:flutter/material.dart';
import 'package:macosui_counter/bloc/counter_bloc.dart';
import 'package:provider/provider.dart';

class MobileCounterButtons extends StatelessWidget {
  const MobileCounterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          mini: true,
          child: Icon(
            Icons.add,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () =>
              Provider.of<CounterBloc>(context, listen: false).increment(),
        ),
        FloatingActionButton(
          mini: true,
          child: Icon(
            Icons.remove,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () =>
              Provider.of<CounterBloc>(context, listen: false).decrement(),
        ),
      ],
    );
  }
}
