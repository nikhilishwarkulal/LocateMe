import 'package:flutter/material.dart';
import 'package:locateme/common/app_colors.dart';
import 'package:locateme/common/app_text_style.dart';
import 'package:locateme/common/widgets/app_image_card_widget.dart';
import 'package:locateme/main.dart';
import 'package:locateme/modules/home/view_model/location_view_model.dart';

const double _height = 4;
const double _width = 32;
const EdgeInsets _header =
    EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 4);
const EdgeInsets _footer = EdgeInsets.only(left: 8.0);
const double _separator = 12;
const double _cellHeight = 125;
const EdgeInsets _listViewPadding = EdgeInsets.only(top: 6, bottom: 6, left: 8);

class ImageCardList extends StatelessWidget {
  /// [locations] when drop down tapped
  final List<LocationViewModel> locations;

  /// [onTap] when cell tapped
  final Function(LocationViewModel) onTap;

  /// [ImageCardList] handles full horizontal screen UI
  const ImageCardList(
      {super.key, required this.locations, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: _height,
        ),
        Center(
          child: Container(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: AppColors.kStarGoldDisableColor,
              borderRadius: BorderRadius.circular(_height),
            ),
          ),
        ),
        Padding(
          padding: _header,
          child: Text(
            appLocalization.locations,
            style: AppTextStyle.k16Medium
                .copyWith(color: AppColors.kPrimaryTextColor),
          ),
        ),
        Padding(
          padding: _footer,
          child: SizedBox(
            height: _cellHeight,
            child: ListView.separated(
              padding: _listViewPadding,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: _separator,
                );
              },
              itemCount: locations.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return AppImageCardWidget(
                  locationViewModel: locations.elementAt(index),
                  onTap: () {
                    onTap(locations.elementAt(index));
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
