import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locateme/common/app_colors.dart';
import 'package:locateme/common/app_text_style.dart';
import 'package:locateme/main.dart';

const double _height = 48;
const double _width = 156;
const double _boxShadowOpacity = 0.4;
const Offset _boxShadowOffset = Offset(0, 0);
const double _boxShadowBlurRadius = 4;
const double _borderRadius = 28;
const double _spacing = 4;
const double _imageSize = 28;
const String _menuImage = "assets/images/menu.svg";

class AppViewListButton extends StatelessWidget {
  /// [onTap] will called when button is tapped
  final Function() onTap;

  /// [AppViewListButton] will show view list button with icon
  const AppViewListButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: _height,
        width: _width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
          color: AppColors.kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.kPrimaryTextColor.withOpacity(_boxShadowOpacity),
              blurRadius: _boxShadowBlurRadius,
              offset: _boxShadowOffset,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              _menuImage,
              width: _imageSize,
              height: _imageSize,
            ),
            const SizedBox(
              width: _spacing,
            ),
            Text(
              appLocalization.viewList,
              style: AppTextStyle.k16Medium
                  .copyWith(color: AppColors.kButtonColor),
            )
          ],
        ),
      ),
    );
  }
}
