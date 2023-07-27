import 'package:fluent_ui/fluent_ui.dart';
import 'package:macosui_counter/bloc/counter_bloc.dart';
import 'package:macosui_counter/ui/widgets/counter_output.dart';
import 'package:provider/provider.dart';

class WindowsCounter extends StatefulWidget {
  const WindowsCounter({super.key});

  @override
  State<WindowsCounter> createState() => _WindowsCounterState();
}

class _WindowsCounterState extends State<WindowsCounter> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        selected: currentIndex,
        onChanged: (index) {
          setState(() => currentIndex = index);
        },
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.add),
            body: const Text('Increment'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.remove),
            body: const Text('Decrement'),
          ),
        ],
      ),
      content: ScaffoldPage(
        // index: currentIndex,
        content: [
          const _Incrementer(),
          const _Decrementer(),
        ][currentIndex],
      ),
    );
  }
}

class _Incrementer extends StatelessWidget {
  const _Incrementer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have pushed the button this many times:',
            style: FluentTheme.of(context).typography.title,
          ),
          const CounterOutput(),
          const SizedBox(height: 8),
          FilledButton(
            child: const Text('Increment'),
            onPressed: () => Provider.of<CounterBloc>(
              context,
              listen: false,
            ).increment(),
          )
        ],
      ),
    );
  }
}

class _Decrementer extends StatelessWidget {
  const _Decrementer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have pushed the button this many times:',
            style: FluentTheme.of(context).typography.title,
          ),
          const CounterOutput(),
          const SizedBox(height: 8),
          FilledButton(
            child: const Text('Decrement'),
            onPressed: () => Provider.of<CounterBloc>(
              context,
              listen: false,
            ).decrement(),
          )
        ],
      ),
    );
  }
}
