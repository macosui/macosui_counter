# macosui_counter

A cross-platform counter app made to demonstrate the macos_ui package and building native UI for multiple platforms.

## Supported Platforms:
- [x] Android
- [x] iOS
- [x] macOS
- [x] Windows
- [ ] Linux
- [ ] Web

## Screenshots

<img src="https://imgur.com/RhInhlU.jpg" width="75%"/>

<img src="https://imgur.com/uKU6PV8.jpg" width="75%"/>

<img src="https://imgur.com/NKknAoR.jpg" width="75%"/>

<img src="https://imgur.com/GuJgp4K.jpg" width="75%"/>

<img src="https://imgur.com/QKINyRT.jpg" width="25%"/>

<img src="https://imgur.com/9bQkGkP.jpg" width="25%"/>

## About this application

This application is similar in nature to Flutter's default counter app. It demonstrates very basic usage 
of macos_ui and is useful for those looking to start out with macos_ui.

Additionally, this application is an exercise in building a modular Flutter application that builds native UI for 
multiple platforms in a clean manner. You will find several `main_platform_x` files in this project:
* `main_macos`
* `main_windows`
* `main_mobile`

These main files exist so that the application can benefit from Flutter's tree shaking, which
removes unused code from a build. For example, you can build this application for macOS with none
of the code that is related to the Windows or mobile implementations by running
```shell
$ flutter run -t lib/main_macos.dart
```
or by creating a run configuration that loads in `main_macos.dart` as the application's entrypoint. The macOS 
implementation of this application will then run, and the UI will look appropriate for a macOS application.

## How to build this application
1. Fork or clone this repository
2. Run on the platform of your choice