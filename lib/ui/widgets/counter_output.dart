import 'package:flutter/material.dart';
import 'package:macosui_counter/bloc/counter_bloc.dart';
import 'package:macosui_counter/ui/widgets/counter_text.dart';
import 'package:provider/provider.dart';

class CounterOutput extends StatelessWidget {
  const CounterOutput({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: Provider.of<CounterBloc>(context).counterSubject,
      initialData: Provider.of<CounterBloc>(context).counterSubject.value,
      builder: (context, snapshot) {
        return CounterText(
          count: snapshot.data!,
        );
      },
    );
  }
}
