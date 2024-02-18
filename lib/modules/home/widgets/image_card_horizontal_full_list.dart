import 'package:flutter/material.dart';
import 'package:locateme/common/app_colors.dart';
import 'package:locateme/common/app_text_style.dart';
import 'package:locateme/common/widgets/app_image_card_horizontal.dart';
import 'package:locateme/modules/home/view_model/location_view_model.dart';

const double _height = 4;
const double _width = 32;
const EdgeInsets _header = EdgeInsets.only(left: 12, right: 12, bottom: 4);
const EdgeInsets _footer = EdgeInsets.only(left: 18.0, right: 18.0, top: 8);
const double _separator = 16;

class ImageCardWithHorizontalFullList extends StatelessWidget {
  /// [onDropDownTapped] when drop down tapped
  final Function()? onDropDownTapped;

  /// [locations] when drop down tapped
  final List<LocationViewModel> locations;

  /// [onTap] when cell tapped
  final Function(LocationViewModel) onTap;

  /// [ImageCardWithHorizontalFullList] handles full screen UI
  const ImageCardWithHorizontalFullList({
    super.key,
    required this.onDropDownTapped,
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
        const Center(
          child: SizedBox(
            width: _width,
            height: _height,
          ),
        ),
        Padding(
          padding: _header,
          child: Text(
            "",
            style: AppTextStyle.k16Medium
                .copyWith(color: AppColors.kPrimaryTextColor),
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
