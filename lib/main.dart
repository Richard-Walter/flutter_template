import 'package:flutter/material.dart';
import 'package:flutter_template/src/localization/string_hardcoded.dart';
import 'dart:async';
import 'src/app.dart';
import 'src/features/settings/presentation/settings_controller.dart';
import 'src/features/settings/services/settings_service.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  // * For more info on error handling, see:
  // * https://docs.flutter.dev/testing/errors
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    //remove # in browser url
    usePathUrlStrategy();

    // Set up the SettingsController, which will glue user settings to multiple
    // Flutter Widgets.
    // todo add this as a provider? and fix up settings route
    final settingsController = SettingsController(SettingsService());

    // Load the user's preferred theme while the splash screen is displayed.
    // This prevents a sudden theme change when the app is first displayed.
    await settingsController.loadSettings();

    // Run the app and pass in the SettingsController. The app listens to the
    // SettingsController for changes, then passes it further down to the
    // SettingsView.
    runApp(MyApp(settingsController: settingsController));

    // * This code will present some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('An unexpected error has occurred'.hardcoded),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (Object error, StackTrace stack) {
    // * Log any errors to console
    debugPrint(error.toString());
  });
}
