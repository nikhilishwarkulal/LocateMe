import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locateme/common/theming/app_theme.dart';
import 'package:locateme/main.dart';

const double _height = 48;
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
          color: context.theme.appColors.kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: context.theme.appColors.kPrimaryTextColor
                  .withOpacity(_boxShadowOpacity),
              blurRadius: _boxShadowBlurRadius,
              offset: _boxShadowOffset,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              _menuImage,
              width: _imageSize,
              height: _imageSize,
              color: context.theme.appColors.kButtonColor,
            ),
            const SizedBox(
              width: _spacing,
            ),
            Text(
              appLocalization.viewList,
              style: context.theme.appTextStyle.k16Medium.copyWith(
                color: context.theme.appColors.kButtonColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
