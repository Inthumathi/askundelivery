import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/const/app_color.dart';
import '../../shared/const/app_data.dart';
import '../../shared/const/flex_tone.dart';
import '../../shared/controllers/theme_controller.dart';
import 'code_theme.dart';

ThemeData flexThemeDark(ThemeController controller) {

  final Color source =
      flexColorSchemeDark(controller, Colors.black).toScheme.surfaceTint;
  // Now we can use a function that takes our ThemeController and source color,
  // which is the effective primary color, the get the effective ThemeData.
  return flexColorSchemeDark(controller, source).toTheme;
}

FlexColorScheme flexColorSchemeDark(ThemeController controller, Color source) {
  final bool useBuiltIn = controller.schemeIndex > 2 &&
      controller.schemeIndex < AppColor.schemes.length - 1;
  final int flexScheme = controller.schemeIndex - 3;
  final bool useScheme = useBuiltIn && !controller.useToDarkMethod;

  // TODO(rydmike): Remove when fix for issue #10386 has landed in stable.
  // Workaround for issue https://github.com/flutter/flutter/issues/103864.
  final bool useFakeTypo2018 =
      (controller.useSubThemes && !controller.useTextTheme) ||
          (!controller.useSubThemes && !controller.useMaterial3);
  final TextTheme? fakeM2TypographyTextTheme =
      useFakeTypo2018 ? AppData.m2TextTheme : null;
  final Typography alwaysM3Typography =
      Typography.material2021(platform: controller.platform);
  // End of fix variables for issue #10386

  return FlexColorScheme.dark(
    // Use scheme based config, when we are using a built-in `FlexScheme`
    // based schemes.
    scheme: useScheme ? FlexScheme.values[flexScheme] : null,
    // Switch to using `FlexSchemeColor` when using 3 first custom schemes or
    // the last one that is customizable.
    colors: !useScheme ? AppColor.scheme(controller).dark : null,
    usedColors: controller.usedColors,
    surfaceMode: controller.surfaceModeDark,
    blendLevel: controller.blendLevelDark,
    appBarStyle: controller.appBarStyleDark,
    appBarOpacity: controller.appBarOpacityDark,
    transparentStatusBar: controller.transparentStatusBar,
    appBarElevation: controller.appBarElevationDark,
    tabBarStyle: controller.tabBarStyle,
    darkIsTrueBlack: controller.darkIsTrueBlack,
    swapLegacyOnMaterial3: controller.swapLegacyColors,
    swapColors: controller.swapDarkColors,
    tooltipsMatchBackground: controller.tooltipsMatchBackground,
    //
    subThemesData: controller.useSubThemes
        ? FlexSubThemesData(
            // Overall effect settings.
            interactionEffects: controller.interactionEffects,
            blendOnLevel: controller.blendOnLevelDark,
            blendOnColors: controller.blendDarkOnColors,
            useFlutterDefaults: controller.useFlutterDefaults,
            // Text theme settings.
            blendTextTheme: controller.blendDarkTextTheme,
            useTextTheme: controller.useTextTheme,
            // Outline default thickness settings.
            thinBorderWidth: controller.thinBorderWidth,
            thickBorderWidth: controller.thickBorderWidth,
            // Default radius for all widgets, if not null.
            defaultRadius: controller.defaultRadius,
            // TextButton settings.
            textButtonRadius: controller.textButtonBorderRadius,
            textButtonSchemeColor: controller.textButtonSchemeColor,
            // ElevatedButton settings.
            elevatedButtonRadius: controller.elevatedButtonBorderRadius,
            elevatedButtonSchemeColor: controller.elevatedButtonSchemeColor,
            elevatedButtonSecondarySchemeColor:
                controller.elevatedButtonSecondarySchemeColor,
            // OutlineButton settings.
            outlinedButtonRadius: controller.outlinedButtonBorderRadius,
            outlinedButtonSchemeColor: controller.outlinedButtonSchemeColor,
            outlinedButtonOutlineSchemeColor:
                controller.outlinedButtonOutlineSchemeColor,
            outlinedButtonBorderWidth: controller.outlinedButtonBorderWidth,
            outlinedButtonPressedBorderWidth:
                controller.outlinedButtonPressedBorderWidth,
            // ToggleButtons settings.
            toggleButtonsRadius: controller.toggleButtonsBorderRadius,
            toggleButtonsSchemeColor: controller.toggleButtonsSchemeColor,
            toggleButtonsBorderWidth: controller.toggleButtonsBorderWidth,
            // Switch, CheckBox, Radio (toggles) settings.
            switchSchemeColor: controller.switchSchemeColor,
            switchThumbSchemeColor: controller.switchThumbSchemeColor,
            checkboxSchemeColor: controller.checkboxSchemeColor,
            radioSchemeColor: controller.radioSchemeColor,
            unselectedToggleIsColored: controller.unselectedToggleIsColored,
            // Slider settings.
            sliderBaseSchemeColor: controller.sliderBaseSchemeColor,
            sliderValueTinted: controller.sliderValueTinted,
            sliderTrackHeight: controller.sliderTrackHeight,
            // Input decoration (TextField) settings.
            inputDecoratorSchemeColor: controller.inputDecoratorSchemeColorDark,
            inputDecoratorIsFilled: controller.inputDecoratorIsFilled,
            inputDecoratorBorderType: controller.inputDecoratorBorderType,
            inputDecoratorRadius: controller.inputDecoratorBorderRadius,
            inputDecoratorUnfocusedHasBorder:
                controller.inputDecoratorUnfocusedHasBorder,
            inputDecoratorUnfocusedBorderIsColored:
                controller.inputDecoratorUnfocusedBorderIsColored,
            inputDecoratorBorderWidth: controller.inputDecoratorBorderWidth,
            inputDecoratorFocusedBorderWidth:
                controller.inputDecoratorFocusedBorderWidth,
            // FAB settings.
            fabRadius: controller.fabBorderRadius,
            fabUseShape: controller.fabUseShape,
            fabAlwaysCircular: controller.fabAlwaysCircular,
            fabSchemeColor: controller.fabSchemeColor,
            // Chip settings.
            chipSchemeColor: controller.chipSchemeColor,
            chipSelectedSchemeColor: controller.chipSelectedSchemeColor,
            chipDeleteIconSchemeColor: controller.chipDeleteIconSchemeColor,
            chipRadius: controller.chipBorderRadius,
            // Card settings.
            cardRadius: controller.cardBorderRadius,
            // PopupMenuButton settings.
            popupMenuRadius: controller.popupMenuBorderRadius,
            popupMenuElevation: controller.popupMenuElevation,
            popupMenuSchemeColor: controller.popupMenuSchemeColor,
            popupMenuOpacity: controller.popupMenuOpacity,
            // Tooltip
            tooltipRadius: controller.tooltipRadius,
            tooltipWaitDuration: controller.tooltipWaitDuration == null
                ? null
                : Duration(milliseconds: controller.tooltipWaitDuration!),
            tooltipShowDuration: controller.tooltipShowDuration == null
                ? null
                : Duration(milliseconds: controller.tooltipShowDuration!),
            tooltipSchemeColor: controller.tooltipSchemeColor,
            tooltipOpacity: controller.tooltipOpacity,
            // Dialog settings.
            dialogBackgroundSchemeColor: controller.dialogBackgroundSchemeColor,
            dialogRadius: controller.dialogBorderRadius,
            timePickerDialogRadius: controller.dialogBorderRadius,
            dialogElevation: controller.dialogElevation,
            // SnackBar settings.
            snackBarBackgroundSchemeColor: controller.snackBarSchemeColor,
            // AppBar settings.
            appBarBackgroundSchemeColor:
                controller.appBarBackgroundSchemeColorDark,
            // TabBar settings.
            tabBarItemSchemeColor: controller.tabBarItemSchemeColorDark,
            tabBarIndicatorSchemeColor: controller.tabBarIndicatorDark,
            // BottomSheet settings.
            bottomSheetBackgroundColor: controller.bottomSheetSchemeColor,
            bottomSheetModalBackgroundColor: controller.bottomSheetSchemeColor,
            bottomSheetRadius: controller.bottomSheetBorderRadius,
            bottomSheetElevation: controller.bottomSheetElevation,
            bottomSheetModalElevation: controller.bottomSheetElevation,
            // BottomNavigationBar settings.
            bottomNavigationBarSelectedLabelSchemeColor:
                controller.bottomNavBarSelectedSchemeColor,
            bottomNavigationBarUnselectedLabelSchemeColor:
                controller.bottomNavBarUnselectedSchemeColor,
            bottomNavigationBarMutedUnselectedLabel:
                controller.bottomNavBarMuteUnselected,
            bottomNavigationBarSelectedIconSchemeColor:
                controller.bottomNavBarSelectedSchemeColor,
            bottomNavigationBarUnselectedIconSchemeColor:
                controller.bottomNavBarUnselectedSchemeColor,
            bottomNavigationBarMutedUnselectedIcon:
                controller.bottomNavBarMuteUnselected,
            bottomNavigationBarBackgroundSchemeColor:
                controller.bottomNavBarBackgroundSchemeColor,
            bottomNavigationBarOpacity: controller.bottomNavigationBarOpacity,
            bottomNavigationBarElevation:
                controller.bottomNavigationBarElevation,
            bottomNavigationBarShowSelectedLabels:
                controller.bottomNavShowSelectedLabels,
            bottomNavigationBarShowUnselectedLabels:
                controller.bottomNavShowUnselectedLabels,
            // NavigationBar settings.
            navigationBarSelectedLabelSchemeColor:
                controller.navBarSelectedSchemeColor,
            navigationBarUnselectedLabelSchemeColor:
                controller.navBarUnselectedSchemeColor,
            navigationBarMutedUnselectedLabel: controller.navBarMuteUnselected,
            navigationBarSelectedIconSchemeColor:
                controller.navBarSelectedSchemeColor,
            navigationBarUnselectedIconSchemeColor:
                controller.navBarUnselectedSchemeColor,
            navigationBarMutedUnselectedIcon: controller.navBarMuteUnselected,
            navigationBarIndicatorSchemeColor:
                controller.navBarIndicatorSchemeColor,
            navigationBarIndicatorOpacity: controller.navBarIndicatorOpacity,
            navigationBarBackgroundSchemeColor:
                controller.navBarBackgroundSchemeColor,
            navigationBarOpacity: controller.navBarOpacity,
            navigationBarElevation: controller.navigationBarElevation,
            navigationBarHeight: controller.navBarHeight,
            navigationBarLabelBehavior: controller.navBarLabelBehavior,
            // NavigationRail settings.
            navigationRailSelectedLabelSchemeColor:
                controller.navRailSelectedSchemeColor,
            navigationRailUnselectedLabelSchemeColor:
                controller.navRailUnselectedSchemeColor,
            navigationRailMutedUnselectedLabel:
                controller.navRailMuteUnselected,
            navigationRailSelectedIconSchemeColor:
                controller.navRailSelectedSchemeColor,
            navigationRailUnselectedIconSchemeColor:
                controller.navRailUnselectedSchemeColor,
            navigationRailMutedUnselectedIcon: controller.navRailMuteUnselected,
            navigationRailUseIndicator: controller.navRailUseIndicator,
            navigationRailIndicatorSchemeColor:
                controller.navRailIndicatorSchemeColor,
            navigationRailIndicatorOpacity: controller.navRailIndicatorOpacity,
            navigationRailBackgroundSchemeColor:
                controller.navRailBackgroundSchemeColor,
            navigationRailOpacity: controller.navRailOpacity,
            navigationRailElevation: controller.navigationRailElevation,
            navigationRailLabelType: controller.navRailLabelType,
          )
        : null,
    //
    // Advanced color properties for seed generated ColorScheme's
    // Use key color based M3 ColorScheme.
    keyColors: FlexKeyColors(
      useKeyColors: controller.useKeyColors,
      useSecondary: controller.useSecondary,
      useTertiary: controller.useTertiary,
      keepPrimary: controller.keepDarkPrimary,
      keepSecondary: controller.keepDarkSecondary,
      keepTertiary: controller.keepDarkTertiary,
      keepPrimaryContainer: controller.keepDarkPrimaryContainer,
      keepSecondaryContainer: controller.keepDarkSecondaryContainer,
      keepTertiaryContainer: controller.keepDarkTertiaryContainer,
    ),
    useMaterial3ErrorColors: controller.useM3ErrorColors,
    tones: FlexTone.values[controller.usedFlexToneSetup]
        .tones(Brightness.dark)
        .onMainsUseBW(controller.onMainsUseBWDark)
        .onSurfacesUseBW(controller.onSurfacesUseBWDark),
    // Use custom surface tint color.
    surfaceTint: controller.surfaceTintDark,
    //
    // ThemeData properties passed along directly to ThemeData.
    visualDensity: AppData.visualDensity,
    // fontFamily: controller.useAppFont ? AppData.font : null,
    platform: controller.platform,
    useMaterial3: controller.useMaterial3,
    // Workaround for issue: https://github.com/flutter/flutter/issues/103864.
    // TODO(rydmike): Remove when fix for issue #10386 has landed in stable.
    typography: alwaysM3Typography,
    // Workaround for issue: https://github.com/flutter/flutter/issues/103864.
    // TODO(rydmike): Remove when fix for issue #10386 has landed in stable.
    textTheme: fakeM2TypographyTextTheme,
    primaryTextTheme: fakeM2TypographyTextTheme,
    // Add a custom theme extension with light mode code highlight colors.
    extensions: <ThemeExtension<dynamic>>{
      CodeTheme.harmonized(source, Brightness.dark),
    },
  );
}
