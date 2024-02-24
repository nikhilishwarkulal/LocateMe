import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  /// [AppColorsExtension] all the color variable declaration is given here
  AppColorsExtension({
    required this.kButtonColor,
    required this.kPrimary,
    required this.kPrimaryDark,
    required this.kPrimaryTextColor,
    required this.kStarGoldColor,
    required this.kStarGoldDisableColor,
    required this.kCardBgColor,
    required this.kWhiteColor,
    required this.kImageStartColor,
    required this.kImageMiddleColor,
    required this.kImageEndColor,
    required this.kSplashTrailingText,
  });
  final Color kButtonColor;
  final Color kPrimary;
  final Color kPrimaryDark;
  final Color kPrimaryTextColor;
  final Color kStarGoldColor;
  final Color kStarGoldDisableColor;
  final Color kCardBgColor;
  final Color kWhiteColor;
  final Color kImageStartColor;
  final Color kImageMiddleColor;
  final Color kImageEndColor;
  final Color kSplashTrailingText;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? kButtonColor,
    Color? kPrimary,
    Color? kPrimaryDark,
    Color? kPrimaryTextColor,
    Color? kStarGoldColor,
    Color? kStarGoldDisableColor,
    Color? kCardBgColor,
    Color? kWhiteColor,
    Color? kImageStartColor,
    Color? kImageMiddleColor,
    Color? kImageEndColor,
    Color? kSplashTrailingText,
  }) {
    return AppColorsExtension(
      kButtonColor: kButtonColor ?? this.kButtonColor,
      kPrimary: kPrimary ?? this.kPrimary,
      kPrimaryDark: kPrimaryDark ?? this.kPrimaryDark,
      kPrimaryTextColor: kPrimaryTextColor ?? this.kPrimaryTextColor,
      kStarGoldColor: kStarGoldColor ?? this.kStarGoldColor,
      kStarGoldDisableColor:
          kStarGoldDisableColor ?? this.kStarGoldDisableColor,
      kCardBgColor: kCardBgColor ?? this.kCardBgColor,
      kWhiteColor: kWhiteColor ?? this.kWhiteColor,
      kImageStartColor: kImageStartColor ?? this.kImageStartColor,
      kImageMiddleColor: kImageMiddleColor ?? this.kImageMiddleColor,
      kImageEndColor: kImageEndColor ?? this.kImageEndColor,
      kSplashTrailingText: kSplashTrailingText ?? this.kSplashTrailingText,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      kButtonColor: Color.lerp(kButtonColor, other.kButtonColor, t)!,
      kPrimary: Color.lerp(kPrimary, other.kPrimary, t)!,
      kPrimaryDark: Color.lerp(kPrimaryDark, other.kPrimaryDark, t)!,
      kPrimaryTextColor:
          Color.lerp(kPrimaryTextColor, other.kPrimaryTextColor, t)!,
      kStarGoldColor: Color.lerp(kStarGoldColor, other.kStarGoldColor, t)!,
      kStarGoldDisableColor:
          Color.lerp(kStarGoldDisableColor, other.kStarGoldDisableColor, t)!,
      kCardBgColor: Color.lerp(kCardBgColor, other.kCardBgColor, t)!,
      kWhiteColor: Color.lerp(kWhiteColor, other.kWhiteColor, t)!,
      kImageStartColor:
          Color.lerp(kImageStartColor, other.kImageStartColor, t)!,
      kImageMiddleColor:
          Color.lerp(kImageMiddleColor, other.kImageMiddleColor, t)!,
      kImageEndColor: Color.lerp(kImageEndColor, other.kImageEndColor, t)!,
      kSplashTrailingText:
          Color.lerp(kSplashTrailingText, other.kSplashTrailingText, t)!,
    );
  }
}
