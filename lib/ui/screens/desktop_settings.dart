import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:macosui_counter/bloc/settings_bloc.dart';
import 'package:provider/provider.dart';

class DesktopSettings extends StatefulWidget {
  const DesktopSettings({Key? key}) : super(key: key);

  @override
  State<DesktopSettings> createState() => _DesktopSettingsState();
}

class _DesktopSettingsState extends State<DesktopSettings> {
  int _currentIndex = 0;

  void _onThemeSelection(ThemeMode themeMode) {
    final settingsBloc = Provider.of<SettingsBloc>(context, listen: false);
    settingsBloc.setThemeModePref(themeMode);
    if (themeMode == ThemeMode.system &&
        Theme.of(context).brightness == Brightness.light) {
      settingsBloc.setBrightnessPref(Brightness.light);
    }
    if (themeMode == ThemeMode.system &&
        Theme.of(context).brightness == Brightness.dark) {
      settingsBloc.setBrightnessPref(Brightness.light);
    }
    if (themeMode == ThemeMode.light) {
      settingsBloc.setBrightnessPref(Brightness.light);
    }

    if (themeMode == ThemeMode.dark) {
      settingsBloc.setBrightnessPref(Brightness.dark);
    }

    // ignore: no-empty-block
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      sidebar: Sidebar(
        minWidth: 200,
        maxWidth: 200,
        builder: (context, scrollController) => SidebarItems(
          currentIndex: _currentIndex,
          onChanged: (value) {},
          items: [
            SidebarItem(
              label: Text('Theme'),
              selectedColor: MacosTheme.brightnessOf(context).isDark
                  ? MacosColors.unemphasizedSelectedContentBackgroundColor
                  : MacosColors.systemGrayColor,
            ),
          ],
        ),
      ),
      child: MacosScaffold(
        titleBar: TitleBar(
          automaticallyImplyLeading: false,
          title: Text('Settings'),
          actions: [
            MacosIconButton(
              icon: Icon(
                CupertinoIcons.clear,
                color: MacosColors.systemGrayColor,
              ),
              backgroundColor: Colors.transparent,
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
        children: [
          ContentArea(
            builder: (context, scrollController) => Column(
              children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PushButton(
                      buttonSize: ButtonSize.large,
                      child: Text('System Theme'),
                      color: MacosColors.systemGrayColor,
                      onPressed: () => _onThemeSelection(ThemeMode.system),
                    ),
                    PushButton(
                      buttonSize: ButtonSize.large,
                      child: Text('Light Theme'),
                      color: MacosColors.white,
                      onPressed: () => _onThemeSelection(ThemeMode.light),
                    ),
                    PushButton(
                      buttonSize: ButtonSize.large,
                      child: Text('Dark Theme'),
                      color: MacosColors.black,
                      onPressed: () => _onThemeSelection(ThemeMode.dark),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
