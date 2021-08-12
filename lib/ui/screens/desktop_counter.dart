import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:macosui_counter/bloc/counter_bloc.dart';
import 'package:macosui_counter/ui/widgets/counter_output.dart';
import 'package:provider/provider.dart';

class DesktopCounter extends StatefulWidget {
  @override
  _DesktopCounterState createState() => _DesktopCounterState();
}

class _DesktopCounterState extends State<DesktopCounter> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      sidebar: Sidebar(
        minWidth: 200,
        builder: (context, scrollController) => SidebarItems(
          selectedColor: MacosColors.unemphasizedSelectedContentBackgroundColor,
          currentIndex: currentIndex,
          onChanged: (value) {
            setState(() => currentIndex = value);
          },
          items: [
            SidebarItem(
              label: Text('Increment'),
            ),
            SidebarItem(
              label: Text('Decrement'),
            ),
          ],
        ),
      ),
      child: MacosScaffold(
        children: [
          ContentArea(
            builder: (context, scrollController) {
              return IndexedStack(
                index: currentIndex,
                children: [
                  _Incrementer(),
                  _Decrementer(),
                ],
              );
            },
          ),
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
          ),
          const SizedBox(height: 8.0),
          CounterOutput(),
          const SizedBox(height: 16.0),
          PushButton(
            child: Text('Increment'),
            buttonSize: ButtonSize.large,
            onPressed: () =>
                Provider.of<CounterBloc>(context, listen: false).increment(),
          ),
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
          ),
          const SizedBox(height: 8.0),
          CounterOutput(),
          const SizedBox(height: 16.0),
          PushButton(
            child: Text('Decrement'),
            buttonSize: ButtonSize.large,
            onPressed: () =>
                Provider.of<CounterBloc>(context, listen: false).decrement(),
          ),
        ],
      ),
    );
  }
}
