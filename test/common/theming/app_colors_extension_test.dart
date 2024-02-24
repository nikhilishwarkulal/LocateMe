import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locateme/common/theming/app_colors_extension.dart';

void main() {
  test('App color extension test', () async {
    AppColorsExtension appColorsExtension = AppColorsExtension(
      kButtonColor: const Color(0xFF000000),
      kPrimary: const Color(0xFF000001),
      kPrimaryDark: const Color(0xFF000002),
      kPrimaryTextColor: const Color(0xFF000003),
      kStarGoldColor: const Color(0xFF000004),
      kStarGoldDisableColor: const Color(0xFF000005),
      kCardBgColor: const Color(0xFF000006),
      kWhiteColor: const Color(0xFF000007),
      kImageStartColor: const Color(0xFF000008),
      kImageMiddleColor: const Color(0xFF000009),
      kImageEndColor: const Color(0xFF000010),
      kSplashTrailingText: const Color(0xFF000011),
    );

    /// [newValue] testing copy with
    AppColorsExtension newValue = appColorsExtension.copyWith(
      kButtonColor: const Color(0xFF100000),
      kPrimary: const Color(0xFF200000),
      kPrimaryDark: const Color(0xFF300000),
      kPrimaryTextColor: const Color(0xFF400000),
      kStarGoldColor: const Color(0xFF500000),
      kStarGoldDisableColor: const Color(0xFF600000),
      kCardBgColor: const Color(0xFF700000),
      kWhiteColor: const Color(0xFF800000),
      kImageStartColor: const Color(0xFF900000),
      kImageMiddleColor: const Color(0xFF110000),
      kImageEndColor: const Color(0xFF120000),
      kSplashTrailingText: const Color(0xFF130000),
    ) as AppColorsExtension;

    expect(newValue.kButtonColor, const Color(0xFF100000));
    expect(newValue.kPrimary, const Color(0xFF200000));
    expect(newValue.kPrimaryDark, const Color(0xFF300000));
    expect(newValue.kPrimaryTextColor, const Color(0xFF400000));
    expect(newValue.kStarGoldColor, const Color(0xFF500000));
    expect(newValue.kStarGoldDisableColor, const Color(0xFF600000));
    expect(newValue.kCardBgColor, const Color(0xFF700000));
    expect(newValue.kWhiteColor, const Color(0xFF800000));
    expect(newValue.kImageStartColor, const Color(0xFF900000));
    expect(newValue.kImageMiddleColor, const Color(0xFF110000));
    expect(newValue.kImageEndColor, const Color(0xFF120000));
    expect(newValue.kSplashTrailingText, const Color(0xFF130000));
    newValue.lerp(newValue, 2);
    AppColorsExtension noValue =
        appColorsExtension.copyWith() as AppColorsExtension;
    expect(noValue.kButtonColor, const Color(0xFF000000));
    expect(noValue.kPrimary, const Color(0xFF000001));
    expect(noValue.kPrimaryDark, const Color(0xFF000002));
    expect(noValue.kPrimaryTextColor, const Color(0xFF000003));
    expect(noValue.kStarGoldColor, const Color(0xFF000004));
    expect(noValue.kStarGoldDisableColor, const Color(0xFF000005));
    expect(noValue.kCardBgColor, const Color(0xFF000006));
    expect(noValue.kWhiteColor, const Color(0xFF000007));
    expect(noValue.kImageStartColor, const Color(0xFF000008));
    expect(noValue.kImageMiddleColor, const Color(0xFF000009));
    expect(noValue.kImageEndColor, const Color(0xFF000010));
    expect(noValue.kSplashTrailingText, const Color(0xFF000011));
  });
}
