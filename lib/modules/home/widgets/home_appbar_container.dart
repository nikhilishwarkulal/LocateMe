import 'package:flutter/material.dart';
import 'package:locateme/common/theming/app_theme.dart';
import 'package:locateme/common/widgets/app_bar_widget.dart';
import 'package:locateme/main.dart';

const double _boxShadowOpacity = 0.1;
const Offset _boxShadowOffset = Offset(0, 0);
const double _boxShadowBlurRadius = 4;

class HomeAppbarContainer extends StatelessWidget {
  /// [onDropDownTapped] when drop down is tapped in appbar
  final Function() onDropDownTapped;

  /// [HomeAppbarContainer] will have the title and the appbar
  const HomeAppbarContainer({super.key, required this.onDropDownTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.appColors.kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(_boxShadowOpacity),
            blurRadius: _boxShadowBlurRadius,
            offset: _boxShadowOffset, // Shadow position
          ),
        ],
      ),
      child: AppBarWidget(
        title: appLocalization.locations,
        dropDownButton: onDropDownTapped,
      ),
    );
  }
}
