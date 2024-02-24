import 'package:flutter/material.dart';
import 'package:locateme/common/theming/app_text_style_extension.dart';

const _fontFamily = "Poppins";

mixin AppTextStyle {
  /// [lightTextStyle] declare the light text style
  /// marked as protected so this class member should not be directly used.
  @protected
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

  /// [darkTextStyle] declare the light text style
  /// marked as protected so this class member should not be directly used.
  @protected
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
