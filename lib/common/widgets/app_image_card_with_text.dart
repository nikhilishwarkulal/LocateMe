import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:locateme/common/theming/app_theme.dart';
import 'package:locateme/common/widgets/app_star_rating.dart';
import 'package:locateme/modules/home/view_model/location_view_model.dart';

const double _width = 200;
const double _height = 152;
const double _boxShadowOpacity = 0.4;
const Offset _boxShadowOffset = Offset(0, 0);
const double _boxShadowBlurRadius = 4;
const double _borderRadius = 5;
const EdgeInsets _textPadding = EdgeInsets.only(left: 8.0, right: 8, top: 8);
const EdgeInsets _ratingPadding = EdgeInsets.only(left: 8.0, right: 8, top: 8);
const double _starRatingHeight = 12;
const int _maxLines = 2;

class AppImageCardWithText extends StatelessWidget {
  /// [locationViewModel]  contains data of the list item
  final LocationViewModel viewModel;

  /// [onTap] will called when list item is tapped
  final Function() onTap;

  /// [AppImageCardWithText] will create horizontal cell item with star rating
  const AppImageCardWithText(
      {super.key, required this.viewModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: context.theme.appColors.kPrimaryDark
                .withOpacity(_boxShadowOpacity),
            blurRadius: _boxShadowBlurRadius,
            offset: _boxShadowOffset,
          )
        ]),
        width: _width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_borderRadius),
          child: Container(
            color: context.theme.appColors.kCardBgColor,
            child: Column(
              children: [
                SizedBox(
                  height: _height,
                  child: CachedNetworkImage(
                    imageUrl: viewModel.url,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: _textPadding,
                  child: Text(
                    viewModel.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: _maxLines,
                    style: context.theme.appTextStyle.k12Regular.copyWith(
                      color: context.theme.appColors.kPrimaryTextColor,
                    ),
                  ),
                ),
                Padding(
                  padding: _ratingPadding,
                  child: SizedBox(
                    height: _starRatingHeight,
                    child: AppStarRating(star: viewModel.rating),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
