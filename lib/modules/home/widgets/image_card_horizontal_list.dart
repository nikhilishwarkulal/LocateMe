import 'package:flutter/material.dart';
import 'package:locateme/common/theming/app_theme.dart';
import 'package:locateme/common/widgets/app_image_card_horizontal.dart';
import 'package:locateme/main.dart';
import 'package:locateme/modules/home/view_model/location_view_model.dart';

const double _height = 4;
const double _width = 32;
const EdgeInsets _header = EdgeInsets.only(left: 18, right: 12, bottom: 4);
const EdgeInsets _footer = EdgeInsets.only(left: 18.0, right: 18.0, top: 8);
const double _separator = 16;

class ImageCardWithHorizontalList extends StatelessWidget {
  /// [locations] when drop down tapped
  final List<LocationViewModel> locations;

  /// [onTap] when cell tapped
  final Function(LocationViewModel) onTap;

  /// [ImageCardWithHorizontalFullList] handles full horizontal screen UI
  const ImageCardWithHorizontalList({
    super.key,
    required this.locations,
    required this.onTap,
  });

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
              color: context.theme.appColors.kStarGoldDisableColor,
              borderRadius: BorderRadius.circular(_height),
            ),
          ),
        ),
        Padding(
          padding: _header,
          child: Text(
            appLocalization.locations,
            style: context.theme.appTextStyle.k16Medium.copyWith(
              color: context.theme.appColors.kPrimaryTextColor,
            ),
          ),
        ),
        Padding(
          padding: _footer,
          child: SizedBox(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: _separator,
                );
              },
              itemCount: locations.length,
              itemBuilder: (BuildContext context, int index) {
                return AppImageCardHorizontal(
                  viewModel: locations.elementAt(index),
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
