import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsBloc {
  SettingsBloc._();

  static Future<SettingsBloc> init() async {
    final bloc = SettingsBloc._();
    await bloc._init();

    return bloc;
  }

  Future<void> _init() async {
    preferences = await SharedPreferences.getInstance();
    readThemeModePref();
  }

  ThemeMode? get currentThemeMode => preferencesSubject.value.themeMode;
  late SharedPreferences preferences;

  final preferencesSubject = BehaviorSubject<Settings>.seeded(
    Settings(
      brightness: Brightness.light,
      themeMode: ThemeMode.system,
    ),
  );

  Future<void> setThemeModePref(ThemeMode themeMode) async {
    await preferences.setString('themeModePref', '${themeMode.toString()}');
    preferencesSubject.add(
      Settings(
        themeMode: themeMode,
        brightness: preferencesSubject.value.brightness,
      ),
    );
  }

  Future<void> setBrightnessPref(Brightness brightness) async {
    await preferences.setString('brightness', brightness.toString());
    preferencesSubject.add(
      Settings(
        themeMode: preferencesSubject.value.themeMode,
        brightness: brightness,
      ),
    );
  }

  void readThemeModePref() {
    String tm =
        preferences.get('themeModePref') as String? ?? 'ThemeMode.system';
    ThemeMode themeMode =
    ThemeMode.values.firstWhere((element) => element.toString() == tm);

    preferencesSubject.add(
      Settings(
        themeMode: themeMode,
        brightness: preferencesSubject.value.brightness,
      ),
    );
  }

  void readBrightnessPref() {
    String b = preferences.getString('brightness') ?? 'Brightness.system';
    final _brightness =
    Brightness.values.firstWhere((element) => element.toString() == b);
    preferencesSubject.add(
      Settings(
        themeMode: preferencesSubject.value.themeMode,
        brightness: _brightness,
      ),
    );
  }

  void close() {
    preferencesSubject.close();
  }
}

class Settings {
  const Settings({
    required this.themeMode,
    required this.brightness,
  });

  final Brightness brightness;
  final ThemeMode themeMode;
}