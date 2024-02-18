import 'package:flutter/material.dart';
import 'package:locateme/common/widgets/app_view_list_button.dart';

const EdgeInsets _padding = EdgeInsets.only(bottom: 34.0, left: 14.0);

class HomeListButtonWidget extends StatelessWidget {
  /// [onTap] will be triggered when list view button is tapped
  final Function() onTap;

  /// [HomeListButtonWidget] will be shown in left bottom of screen
  const HomeListButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: _padding,
        child: AppViewListButton(
          onTap: onTap,
        ),
      ),
    );
  }
}
