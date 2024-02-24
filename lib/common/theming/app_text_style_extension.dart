import 'package:flutter/material.dart';

class AppTextStyleExtension extends ThemeExtension<AppTextStyleExtension> {
  /// [AppTextStyleExtension] all the text style variable declaration is given here
  const AppTextStyleExtension({
    required this.k32Medium,
    required this.k18Regular,
    required this.k16Medium,
    required this.k12Regular,
  });

  final TextStyle k32Medium;
  final TextStyle k18Regular;
  final TextStyle k16Medium;
  final TextStyle k12Regular;
  @override
  ThemeExtension<AppTextStyleExtension> copyWith({
    TextStyle? k32Medium,
    TextStyle? k18Regular,
    TextStyle? k16Medium,
    TextStyle? k12Regular,
  }) {
    return AppTextStyleExtension(
      k32Medium: k32Medium ?? this.k32Medium,
      k18Regular: k18Regular ?? this.k18Regular,
      k16Medium: k16Medium ?? this.k16Medium,
      k12Regular: k12Regular ?? this.k12Regular,
    );
  }

  @override
  ThemeExtension<AppTextStyleExtension> lerp(
    covariant ThemeExtension<AppTextStyleExtension>? other,
    double t,
  ) {
    if (other is! AppTextStyleExtension) {
      return this;
    }

    return AppTextStyleExtension(
      k32Medium: TextStyle.lerp(k32Medium, other.k32Medium, t)!,
      k18Regular: TextStyle.lerp(k18Regular, other.k18Regular, t)!,
      k16Medium: TextStyle.lerp(k16Medium, other.k16Medium, t)!,
      k12Regular: TextStyle.lerp(k12Regular, other.k12Regular, t)!,
    );
  }
}
