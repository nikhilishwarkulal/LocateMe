import 'package:flutter/material.dart';
import 'package:locateme/common/theming/app_colors_extension.dart';

mixin AppColors {
  /// [lightAppColors] declare the light app Color
  /// marked as protected so this class member should not be directly used.
  @protected
  static final lightAppColors = AppColorsExtension(
    kButtonColor: const Color(0xFF0085FF),
    kPrimary: const Color(0xFF0085FF),
    kPrimaryDark: const Color(0xFF1C3550),
    kSplashTrailingText: const Color(0xFF1C3550),
    kPrimaryTextColor: const Color(0xFF0D0D26),
    kStarGoldColor: const Color(0xFFF3CC00),
    kStarGoldDisableColor: const Color(0xFFD9D9D9),
    kCardBgColor: const Color(0xFFFBFBFB),
    kWhiteColor: const Color(0xFFFFFFFF),
    kImageStartColor: Colors.black.withOpacity(0),
    kImageMiddleColor: Colors.black.withOpacity(0.58),
    kImageEndColor: Colors.black.withOpacity(0.84),
  );

  /// [lightAppColors] declare the light app Color
  /// marked as protected so this class member should not be directly used.
  @protected
  static final darkAppColors = AppColorsExtension(
    kButtonColor: const Color(0xFFFFFFFF),
    kPrimary: const Color(0xFFFFFFFF),
    kPrimaryDark: const Color(0xFF000000),
    kSplashTrailingText: const Color(0xFF939393),
    kPrimaryTextColor: const Color(0xFFFFFFFF),
    kStarGoldColor: const Color(0xFFF3CC00),
    kStarGoldDisableColor: const Color(0xFFD9D9D9),
    kCardBgColor: const Color(0xFF6E6E6E),
    kWhiteColor: const Color(0xFF444444),
    kImageStartColor: Colors.black.withOpacity(0),
    kImageMiddleColor: Colors.black.withOpacity(0.58),
    kImageEndColor: Colors.black.withOpacity(0.84),
  );
}
