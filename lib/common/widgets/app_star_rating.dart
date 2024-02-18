import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String _goldStarImage = "assets/images/star_gold.svg";
const String _disabledStarImage = "assets/images/star_disable.svg";

class AppStarRating extends StatelessWidget {
  /// [star] number of stars to be shown
  final int star;

  /// [height] height of star
  final double height;

  /// [AppStarRating] will show the 5 star with disabled and enabled capability
  /// if less then 0 is passed as star then star rating will be 0. and
  /// if more than 5 is passed as star then star rating will be 5.
  const AppStarRating({super.key, required this.star, this.height = 12});

  @override
  Widget build(BuildContext context) {
    int finalStar = star >= 5 ? 5 : star;
    finalStar = star <= 0 ? 0 : star;
    return Row(
      children: [
        ...List<Widget>.generate(finalStar, (index) {
          return getGoldenStar();
        }).toList(),
        ...List<Widget>.generate(5 - finalStar, (index) {
          return getGDisableStar();
        }).toList(),
      ],
    );
  }

  Widget getGoldenStar() {
    return SizedBox(
      height: height,
      width: height,
      child: SvgPicture.asset(
        _goldStarImage,
        height: height,
        width: height,
      ),
    );
  }

  Widget getGDisableStar() {
    return SizedBox(
      height: height,
      width: height,
      child: SvgPicture.asset(
        _disabledStarImage,
        height: height,
        width: height,
      ),
    );
  }
}
