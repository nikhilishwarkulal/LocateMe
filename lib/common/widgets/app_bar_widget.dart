import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locateme/common/app_colors.dart';
import 'package:locateme/common/app_text_style.dart';

const double _appBarPadding = 18;
const double _appBarHeight = 56;
const String _dropDownImage = "assets/images/drop_down.svg";

class AppBarWidget extends StatelessWidget {
  /// [dropDownButton] when dropDown button in the right side is clicked.
  final Function()? dropDownButton;

  /// [title] to be displayed in app bar header
  final String title;

  /// [AppBarWidget] shown in the top screen
  const AppBarWidget({
    Key? key,
    this.dropDownButton,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: _appBarPadding,
        right: _appBarPadding,
      ),
      child: SizedBox(
        height: _appBarHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyle.k18Regular.copyWith(
                color: AppColors.kPrimaryTextColor,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: dropDownButton,
              behavior: HitTestBehavior.translucent,
              child: SvgPicture.asset(_dropDownImage),
            )
          ],
        ),
      ),
    );
  }
}
