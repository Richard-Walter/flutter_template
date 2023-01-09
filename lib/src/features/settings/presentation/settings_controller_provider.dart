import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/src/features/settings/presentation/settings_controller.dart';
import 'package:flutter_template/src/features/settings/application/settings_service.dart';

final settingsControllerProvider = FutureProvider<SettingsController>( (ref) async {

   // Set up the SettingsController, which will glue user settings to multiple Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  return settingsController;
});
