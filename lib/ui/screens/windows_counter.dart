import 'package:fluent_ui/fluent_ui.dart';
import 'package:macosui_counter/bloc/counter_bloc.dart';
import 'package:macosui_counter/ui/widgets/counter_output.dart';
import 'package:provider/provider.dart';

class WindowsCounter extends StatefulWidget {
  const WindowsCounter({Key? key}) : super(key: key);

  @override
  _WindowsCounterState createState() => _WindowsCounterState();
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
            icon: Icon(FluentIcons.add),
            title: const Text('Increment'),
          ),
          PaneItem(
            icon: Icon(FluentIcons.remove),
            title: const Text('Decrement'),
          ),
        ],
      ),
      content: NavigationBody(
        index: currentIndex,
        children: [
          _Incrementer(),
          _Decrementer(),
        ],
      ),
    );
  }
}

class _Incrementer extends StatelessWidget {
  const _Incrementer({Key? key}) : super(key: key);

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
          CounterOutput(),
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
  const _Decrementer({Key? key}) : super(key: key);

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
          CounterOutput(),
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
