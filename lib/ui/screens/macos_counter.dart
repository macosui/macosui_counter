import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:macosui_counter/bloc/counter_bloc.dart';
import 'package:macosui_counter/ui/widgets/counter_output.dart';
import 'package:macosui_counter/ui/widgets/info_text.dart';
import 'package:provider/provider.dart';

class MacosCounter extends StatefulWidget {
  @override
  _MacosCounterState createState() => _MacosCounterState();
}

class _MacosCounterState extends State<MacosCounter> {
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
              label: const MacosListTile(
                leading: Icon(CupertinoIcons.add_circled),
                title: Text('Increment'),
              ),
            ),
            SidebarItem(
              label: const MacosListTile(
                leading: Icon(CupertinoIcons.minus_circle),
                title: Text('Decrement'),
              ),
            ),
          ],
        ),
        bottom: Padding(
          padding: const EdgeInsets.all(8),
          child: MacosListTile(
            onClick: () => showMacosAlertDialog(
              context: context,
              builder: (_) => MacosAlertDialog(
                appIcon: FlutterLogo(size: 56),
                title: const Text('macosui_counter'),
                message: const InfoText(),
                primaryButton: PushButton(
                  buttonSize: ButtonSize.large,
                  child: Text('Dismiss'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            leading: Icon(
              CupertinoIcons.info,
              color: MacosTheme.brightnessOf(context).isDark
                  ? Colors.white
                  : Colors.black,
            ),
            title: Text(
              'Info',
              style: MacosTheme.of(context).typography.title2,
            ),
          ),
        ),
      ),
      child: Builder(
        builder: (context) {
          return MacosScaffold(
            titleBar: TitleBar(
              title: const Text('Counter'),
              actions: [
                MacosIconButton(
                  icon: Icon(
                    CupertinoIcons.sidebar_left,
                    color: MacosColors.systemGrayColor,
                  ),
                  backgroundColor: Colors.transparent,
                  onPressed: () => MacosWindowScope.of(context).toggleSidebar(),
                ),
              ],
            ),
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
          );
        },
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
          const Text(
            'You have pushed the button this many times:',
          ),
          const SizedBox(height: 8.0),
          CounterOutput(),
          const SizedBox(height: 16.0),
          PushButton(
            child: const Text('Increment'),
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
          const Text(
            'You have pushed the button this many times:',
          ),
          const SizedBox(height: 8.0),
          CounterOutput(),
          const SizedBox(height: 16.0),
          PushButton(
            child: const Text('Decrement'),
            buttonSize: ButtonSize.large,
            onPressed: () =>
                Provider.of<CounterBloc>(context, listen: false).decrement(),
          ),
        ],
      ),
    );
  }
}
