import 'package:flutter/material.dart';
import 'package:locateme/modules/home/home_scroll_bloc/home_scroll_state.dart';
import 'package:locateme/modules/home/view_model/location_view_model.dart';
import 'package:locateme/modules/home/widgets/image_card_horizontal_full_list.dart';
import 'package:locateme/modules/home/widgets/image_card_horizontal_list.dart';
import 'package:locateme/modules/home/widgets/image_card_list.dart';
import 'package:locateme/modules/home/widgets/image_card_with_text_list.dart';

import '../home_bloc/home_state.dart';

class HomeTransitionWidget extends StatelessWidget {
  /// [homeState] handles screen state
  final HomeState homeState;

  /// [homeScrollStateUpdate] when scroll is updated.
  final HomeScrollStateUpdate homeScrollStateUpdate;

  /// [onLocationTapped] when back tapped.
  final Function(LocationViewModel) onLocationTapped;

  /// [onDropDownTapped] when dropDown in appbar tapped.
  final Function() onDropDownTapped;

  /// [HomeTransitionWidget] will decide the type of ui to be shown
  const HomeTransitionWidget({
    super.key,
    required this.homeState,
    required this.homeScrollStateUpdate,
    required this.onLocationTapped,
    required this.onDropDownTapped,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1500),
      child: getChild,
    );
  }

  Widget get getChild {
    switch (homeScrollStateUpdate.stepState) {
      case ScrollStepState.showOnlyImageCard:
        return ImageCardList(
          locations: homeState.listOfLocations,
          onTap: onLocationTapped,
        );
      case ScrollStepState.showCardWithTitle:
        return ImageCardWithTextList(
          locations: homeState.listOfLocations,
          onTap: onLocationTapped,
        );
      case ScrollStepState.showListView:
        return ImageCardWithHorizontalList(
          locations: homeState.listOfLocations,
          onTap: onLocationTapped,
        );
      case ScrollStepState.showListViewWithAppBar:
        return ImageCardWithHorizontalFullList(
          onTap: onLocationTapped,
          onDropDownTapped: onDropDownTapped,
          locations: homeState.listOfLocations,
        );
      case ScrollStepState.showButtonOnly:
      case ScrollStepState.doNotShowAnything:
        return const SizedBox();
    }
  }
}
