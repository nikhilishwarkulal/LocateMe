import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:locateme/common/app_colors.dart';
import 'package:locateme/common/app_text_style.dart';
import 'package:locateme/modules/home/view_model/location_view_model.dart';

const double _width = 100;
const double _gradHeight = 40;
const int _maxLines = 2;
const double _boxShadowOpacity = 0.4;
const Offset _boxShadowOffset = Offset(0, 0);
const double _boxShadowBlurRadius = 4;
const double _borderRadius = 5;
const List<double> _linearGradStops = [0, 0.65, 1];
const double _titlePadding = 4;

class AppImageCardWidget extends StatelessWidget {
  /// [locationViewModel]  contains data of the list item
  final LocationViewModel locationViewModel;

  /// [onTap] will called when list item is tapped
  final Function() onTap;

  /// [AppImageCardWidget] will shows text and image. star rating
  /// will not been shown
  const AppImageCardWidget({
    super.key,
    required this.locationViewModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColors.kPrimaryTextColor.withOpacity(_boxShadowOpacity),
            blurRadius: _boxShadowBlurRadius,
            offset: _boxShadowOffset,
          )
        ]),
        width: _width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_borderRadius),
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: locationViewModel.url,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: _gradHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.kImageStartColor,
                        AppColors.kImageMiddleColor,
                        AppColors.kImageEndColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: _linearGradStops,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(_titlePadding),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          locationViewModel.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: _maxLines,
                          style: AppTextStyle.k12Regular
                              .copyWith(color: AppColors.kWhiteColor),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
