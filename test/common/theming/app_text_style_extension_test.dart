import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locateme/common/theming/app_text_style_extension.dart';

void main() {
  test('App Text Style extension test', () async {
    AppTextStyleExtension appColorsExtension = AppTextStyleExtension(
      k32Medium: TestAppTextStyle.lightTextStyle.k32Medium,
      k12Regular: TestAppTextStyle.lightTextStyle.k12Regular,
      k16Medium: TestAppTextStyle.lightTextStyle.k16Medium,
      k18Regular: TestAppTextStyle.lightTextStyle.k18Regular,
    );

    /// [newValue] testing copy with
    AppTextStyleExtension newValue = appColorsExtension.copyWith(
      k32Medium: TestAppTextStyle.darkTextStyle.k32Medium,
      k12Regular: TestAppTextStyle.darkTextStyle.k12Regular,
      k16Medium: TestAppTextStyle.darkTextStyle.k16Medium,
      k18Regular: TestAppTextStyle.darkTextStyle.k18Regular,
    ) as AppTextStyleExtension;

    expect(newValue.k12Regular, TestAppTextStyle.darkTextStyle.k12Regular);
    expect(newValue.k32Medium, TestAppTextStyle.darkTextStyle.k32Medium);
    expect(newValue.k16Medium, TestAppTextStyle.darkTextStyle.k16Medium);
    expect(newValue.k18Regular, TestAppTextStyle.darkTextStyle.k18Regular);
    newValue.lerp(newValue, 2);
    AppTextStyleExtension noValue =
        appColorsExtension.copyWith() as AppTextStyleExtension;
    expect(noValue.k12Regular, TestAppTextStyle.darkTextStyle.k12Regular);
    expect(noValue.k32Medium, TestAppTextStyle.darkTextStyle.k32Medium);
    expect(noValue.k16Medium, TestAppTextStyle.darkTextStyle.k16Medium);
    expect(noValue.k18Regular, TestAppTextStyle.darkTextStyle.k18Regular);
  });
}

const _fontFamily = "Poppins";

mixin TestAppTextStyle {
  static const lightTextStyle = AppTextStyleExtension(
    k32Medium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 32,
      fontFamily: _fontFamily,
    ),
    k18Regular: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      fontFamily: _fontFamily,
    ),
    k16Medium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      fontFamily: _fontFamily,
    ),
    k12Regular: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      fontFamily: _fontFamily,
    ),
  );
  static const darkTextStyle = AppTextStyleExtension(
    k32Medium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 32,
      fontFamily: _fontFamily,
    ),
    k18Regular: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      fontFamily: _fontFamily,
    ),
    k16Medium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      fontFamily: _fontFamily,
    ),
    k12Regular: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      fontFamily: _fontFamily,
    ),
  );
}
