import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:macosui_counter/bloc/counter_bloc.dart';
import 'package:macosui_counter/ui/widgets/counter_output.dart';
import 'package:macosui_counter/ui/widgets/info_text.dart';
import 'package:provider/provider.dart';

class MacosCounter extends StatefulWidget {
  const MacosCounter({super.key});

  @override
  State<MacosCounter> createState() => _MacosCounterState();
}

class _MacosCounterState extends State<MacosCounter> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      sidebar: Sidebar(
        minWidth: 200,
        builder: (context, scrollController) => SidebarItems(
          currentIndex: currentIndex,
          itemSize: SidebarItemSize.large,
          onChanged: (value) => setState(() {
            currentIndex = value;
          }),
          items: const [
            SidebarItem(
              leading: MacosIcon(CupertinoIcons.add_circled),
              label: Text('Increment'),
            ),
            SidebarItem(
              leading: MacosIcon(CupertinoIcons.minus_circle),
              label: Text('Decrement'),
            ),
          ],
        ),
        bottom: MacosListTile(
          onClick: () => showMacosAlertDialog(
            context: context,
            builder: (_) => MacosAlertDialog(
              appIcon: const FlutterLogo(size: 64),
              title: const Text('macosui_counter'),
              message: const InfoText(),
              primaryButton: PushButton(
                controlSize: ControlSize.large,
                child: const Text('Dismiss'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          leading: MacosIcon(
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
      child: Builder(
        builder: (context) {
          return MacosScaffold(
            toolBar: ToolBar(
              leading: MacosTooltip(
                message: 'Toggle Sidebar',
                useMousePosition: false,
                child: MacosIconButton(
                  icon: MacosIcon(
                    CupertinoIcons.sidebar_left,
                    color: MacosTheme.brightnessOf(context).resolve(
                      const Color.fromRGBO(0, 0, 0, 0.5),
                      const Color.fromRGBO(255, 255, 255, 0.5),
                    ),
                    size: 20.0,
                  ),
                  boxConstraints: const BoxConstraints(
                    minHeight: 20,
                    minWidth: 20,
                    maxWidth: 48,
                    maxHeight: 38,
                  ),
                  onPressed: () => MacosWindowScope.of(context).toggleSidebar(),
                ),
              ),
              title: const Text('macosui_counter'),
            ),
            children: [
              ContentArea(
                builder: (context, scrollController) {
                  return IndexedStack(
                    index: currentIndex,
                    children: const [
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
  const _Incrementer();

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
          const CounterOutput(),
          const SizedBox(height: 16.0),
          PushButton(
            controlSize: ControlSize.large,
            onPressed: () =>
                Provider.of<CounterBloc>(context, listen: false).increment(),
            child: const Text('Increment'),
          ),
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
          const Text(
            'You have pushed the button this many times:',
          ),
          const SizedBox(height: 8.0),
          const CounterOutput(),
          const SizedBox(height: 16.0),
          PushButton(
            controlSize: ControlSize.large,
            onPressed: () =>
                Provider.of<CounterBloc>(context, listen: false).decrement(),
            child: const Text('Decrement'),
          ),
        ],
      ),
    );
  }
}
