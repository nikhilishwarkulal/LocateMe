import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locateme/common/theming/app_theme.dart';
import 'package:locateme/get_it.dart';
import 'package:locateme/modules/home/helper/home_helper.dart';
import 'package:locateme/modules/home/home_bloc/home_bloc.dart';
import 'package:locateme/modules/home/home_bloc/home_event.dart';
import 'package:locateme/modules/home/home_bloc/home_state.dart';
import 'package:locateme/modules/home/home_screen.dart';
import 'package:locateme/modules/home/home_scroll_bloc/home_scroll_bloc.dart';
import 'package:locateme/modules/home/home_scroll_bloc/home_scroll_event.dart';
import 'package:locateme/modules/home/home_scroll_bloc/home_scroll_state.dart';
import 'package:locateme/modules/home/view_model/location_view_model.dart';

abstract class HomeStateHandler extends State<HomeScreen> with HomeHelper {
  /// [draggableScrollController] to show step based ui
  final DraggableScrollableController draggableScrollController =
      DraggableScrollableController();

  /// [homeScrollBloc] to show step based ui in home page
  final HomeScrollBloc homeScrollBloc = getIt<HomeScrollBloc>();

  /// [homeScreenBloc] handles home Screen Ui data
  final HomeScreenBloc homeScreenBloc = HomeScreenBloc();

  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  /// [onLocationTapped] when any list item is tapped a bloc event will
  /// be sent on tap. and also if the UI is showing as Vertical list then
  /// it will be scrolled down so map is visible to user.
  void onLocationTapped(LocationViewModel locationViewModel) {
    if (homeScrollBloc.state.stepState == ScrollStepState.showListView ||
        homeScrollBloc.state.stepState ==
            ScrollStepState.showListViewWithAppBar) {
      double screenHeight = getScreenHeight();
      double bottomPadding = getBottomPadding();
      draggableScrollController.animateTo(
          getStepSizeLowDraggableSheetValue(screenHeight, bottomPadding),
          duration: const Duration(milliseconds: 100),
          curve: Curves.linear);
      Future.delayed(
        const Duration(milliseconds: 100),
        () {
          homeScreenBloc
              .add(HomeEventOnSelect(selectedModel: locationViewModel));
        },
      );
    } else {
      homeScreenBloc.add(HomeEventOnSelect(selectedModel: locationViewModel));
    }
  }

  /// [moveInMap] will move the map camera towards the coordinates
  /// [HomeState] contains latLong
  void moveInMap(HomeState homeState) async {
    final GoogleMapController controller = await mapController.future;
    CameraPosition kLake = CameraPosition(
        target: LatLng(
            (homeState as HomeStateSelectedState).selectedLocation.lat,
            (homeState).selectedLocation.long),
        zoom: 8.151926040649414);
    await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }

  /// [createMarkersFromState] will create a marker towards the coordinates
  /// [HomeState] contains latLong
  Set<Marker> createMarkersFromState(HomeState homeState) {
    Set<Marker> marker = {};
    if (homeState is HomeStateSelectedState) {
      marker.add(
        Marker(
          markerId: const MarkerId("map"),
          position: LatLng(
            (homeState).selectedLocation.lat,
            (homeState).selectedLocation.long,
          ),
        ),
      );
    }
    return marker;
  }

  /// [getScreenHeight] gets the screen height
  double getScreenHeight();

  /// [getBottomPadding] gets the screen safeArea bottom
  double getBottomPadding();

  /// [getTopPadding] gets the screen safeArea top
  double getTopPadding();

  /// [onDropDownTapped] when dropDownClicked
  void onDropDownTapped() {
    double screenHeight = getScreenHeight();
    draggableScrollController.animateTo(
        getStepSizeHighDraggableSheetValue(screenHeight),
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear);
  }

  /// [onAppListViewButtonTapped] when list view is tapped
  /// draggableScroll widget will come up
  void onAppListViewButtonTapped() {
    double screenHeight = getScreenHeight();
    double bottomPadding = getBottomPadding();
    draggableScrollController.animateTo(
      getStepSizeLowDraggableSheetValue(screenHeight, bottomPadding),
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
    );
  }

  /// [runPeriodicCheck] when scrolling happens these continuously checks
  /// for screen state change. and updates UI accordingly.
  Future<void> runPeriodicCheck() async {
    double screenHeight = getScreenHeight();
    double bottomPadding = getBottomPadding();
    double topPadding = getTopPadding();

    homeScrollBloc.add(HomeScrollEventUpdate(
      scrollableSizeValue: () => draggableScrollController.size,
      screenSize: screenHeight,
      bottomPadding: bottomPadding,
      topPadding: topPadding,
    ));
    if (context.theme.brightness == Brightness.dark) {
      var darkMapStyle = await rootBundle.loadString('assets/maps/dark.json');
      var controller = await mapController.future;
      controller.setMapStyle(darkMapStyle);
    } else {
      var lightMapStyle = await rootBundle.loadString('assets/maps/light.json');
      var controller = await mapController.future;
      controller.setMapStyle(lightMapStyle);
    }
  }
}
