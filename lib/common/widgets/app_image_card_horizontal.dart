import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:locateme/common/theming/app_theme.dart';
import 'package:locateme/common/widgets/app_star_rating.dart';
import 'package:locateme/modules/home/view_model/location_view_model.dart';

const double _boxShadowOpacity = 0.4;
const Offset _boxShadowOffset = Offset(0, 0);
const double _boxShadowBlurRadius = 4;
const double _height = 86;
const double _width = 120;
const EdgeInsets _textPadding = EdgeInsets.only(left: 12.0, right: 8, top: 8);
const EdgeInsets _ratingPadding =
    EdgeInsets.only(left: 12.0, right: 8, top: 12);
const double _starRatingHeight = 15;

class AppImageCardHorizontal extends StatelessWidget {
  /// [locationViewModel]  contains data of the list item
  final LocationViewModel viewModel;

  /// [onTap] will called when list item is tapped
  final Function() onTap;

  /// [AppImageCardHorizontal] will create horizontal cell item with star rating
  const AppImageCardHorizontal({
    super.key,
    required this.viewModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: context.theme.appColors.kPrimaryDark
                .withOpacity(_boxShadowOpacity),
            blurRadius: _boxShadowBlurRadius,
            offset: _boxShadowOffset,
          )
        ]),
        height: _height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color: context.theme.appColors.kCardBgColor,
            child: Row(
              children: [
                SizedBox(
                  width: _width,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      imageUrl: viewModel.url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: _textPadding,
                        child: Text(
                          viewModel.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: context.theme.appTextStyle.k12Regular.copyWith(
                            color: context.theme.appColors.kPrimaryTextColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: _ratingPadding,
                        child: SizedBox(
                          height: 12,
                          child: AppStarRating(
                              star: viewModel.rating,
                              height: _starRatingHeight),
                        ),
                      ),
                    ],
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
