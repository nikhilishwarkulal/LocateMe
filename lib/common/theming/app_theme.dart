import 'package:flutter/material.dart';
import 'package:locateme/common/app_colors.dart';
import 'package:locateme/common/app_text_style.dart';
import 'package:locateme/common/theming/app_colors_extension.dart';
import 'package:locateme/common/theming/app_text_style_extension.dart';

class AppTheme with AppTextStyle, AppColors {
  /// provide the light themes texts style and app color
  static final light = ThemeData.light().copyWith(
    extensions: [
      AppColors.lightAppColors,
      AppTextStyle.lightTextStyle,
    ],
  );

  /// default app color is light
  static AppColorsExtension get getDefaultAppColors => AppColors.lightAppColors;

  /// text style is same for both light and dark
  static AppTextStyleExtension get getDefaultTextStyle =>
      AppTextStyle.lightTextStyle;

  /// provide the dark themes texts style and app color
  static final dark = ThemeData.dark().copyWith(
    extensions: [
      AppColors.darkAppColors,
      AppTextStyle.darkTextStyle,
    ],
  );
}

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme.getDefaultAppColors;

  /// Usage example: Theme.of(context).appColors;
  AppTextStyleExtension get appTextStyle =>
      extension<AppTextStyleExtension>() ?? AppTheme.getDefaultTextStyle;
}

/// This [extension] makes the calling of themes
/// very simple and easy
extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}

/// this class uses provider that wrapped in material app
/// this can handle the changing of theme in run time.
class AppThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  AppThemeNotifier();

  ThemeMode get themeMode => _themeMode;

  /// [themeMode] handles changing of theme
  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
