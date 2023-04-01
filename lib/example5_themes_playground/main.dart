import 'package:flutter/material.dart';

import '../shared/controllers/theme_controller.dart';
import '../shared/services/theme_service.dart';
import '../shared/services/theme_service_hive.dart';
import 'theme/flex_theme_dark.dart';
import 'theme/flex_theme_light.dart';
import 'theme/theme_data_dark.dart';
import 'theme/theme_data_light.dart';
import 'widgets/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ThemeService themeService =
      ThemeServiceHive('flex_color_scheme_v5_box_5');
  // Initialize the theme service.
  await themeService.init();
  // Create a ThemeController that uses the ThemeService.
  final ThemeController themeController = ThemeController(themeService);
  // Load preferred theme settings, while the app is loading, before MaterialApp
  // is created, this prevents a theme change when the app is first displayed.
  await themeController.loadAll();
  // Run the app and pass in the ThemeController. The app listens to the
  // ThemeController for changes. The same ThemeController as used in example 4
  // controls all the myriad of Theme settings and the ThemeService also
  // persists the settings with the injected ThemeServiceHive.
  runApp(PlaygroundApp(controller: themeController));
}

class PlaygroundApp extends StatelessWidget {
  const PlaygroundApp({super.key, required this.controller});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    // Whenever the theme controller notifies the animation listener in the
    // AnimatedBuilder, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Themes Playground',
          // // The Theme controller controls if we use FlexColorScheme made
          // // ThemeData or standard SDK ThemeData.from a ColorScheme. It also
          // // controls all the configuration parameters used to define the
          // // FlexColorScheme object that produces the ThemeData object.
          // theme: controller.useFlexColorScheme
          //     ? flexThemeLight(controller)
          //     : themeDataLight(controller),
          // darkTheme: controller.useFlexColorScheme
          //     ? flexThemeDark(controller)
          //     : themeDataDark(controller),
          // // Use the dark or light theme based on controller setting.
          // themeMode: controller.themeMode,
          home: HomePage(controller: controller),
        );
      },
    );
  }
}
