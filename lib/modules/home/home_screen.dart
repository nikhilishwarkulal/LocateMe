import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locateme/common/theming/app_theme.dart';
import 'package:locateme/modules/home/helper/home_handler.dart';
import 'package:locateme/modules/home/home_bloc/home_bloc.dart';
import 'package:locateme/modules/home/home_bloc/home_event.dart';
import 'package:locateme/modules/home/home_bloc/home_state.dart';
import 'package:locateme/modules/home/home_scroll_bloc/home_scroll_bloc.dart';
import 'package:locateme/modules/home/home_scroll_bloc/home_scroll_state.dart';
import 'package:locateme/modules/home/widgets/home_appbar_container.dart';
import 'package:locateme/modules/home/widgets/home_list_button_widget.dart';
import 'package:locateme/modules/home/widgets/home_map_view.dart';
import 'package:locateme/modules/home/widgets/home_transistion_widget.dart';

const double _boxShadowOpacity = 0.4;
const Offset _boxShadowOffset = Offset(0, 0);
const double _boxShadowBlurRadius = 4;
const BorderRadius borderRadiusZero = BorderRadius.only(
  topLeft: Radius.circular(0),
  topRight: Radius.circular(0),
);

const BorderRadius borderRadiusEight = BorderRadius.only(
  topLeft: Radius.circular(8),
  topRight: Radius.circular(8),
);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends HomeStateHandler {
  @override
  void initState() {
    super.initState();

    /// this will start loading list data
    homeScreenBloc.add(const HomeEventLoadData());

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      /// this will check for scroll
      await runPeriodicCheck();
    });
  }

  @override

  /// [getBottomPadding] get the bottom padding
  double getBottomPadding() {
    return MediaQuery.of(context).padding.bottom;
  }

  @override

  /// [getScreenHeight] get the screen height
  double getScreenHeight() {
    return MediaQuery.of(context).size.height;
  }

  @override

  /// [getTopPadding] get the screen top padding
  double getTopPadding() {
    return MediaQuery.of(context).padding.top;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = getScreenHeight();
    double bottomPadding = getBottomPadding();
    double topPadding = getTopPadding();
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            BlocBuilder<HomeScreenBloc, HomeState>(
              bloc: homeScreenBloc,
              buildWhen: (previous, current) {
                return current is HomeStateSelectedState;
              },
              builder: (BuildContext context, HomeState homeState) {
                return HomeMapView(
                  mapController: mapController,
                  marker: createMarkersFromState(homeState),
                );
              },
            ),
            BlocBuilder<HomeScrollBloc, HomeScrollStateUpdate>(
                bloc: homeScrollBloc,
                builder: (context, state) {
                  if (state.stepState !=
                      ScrollStepState.showListViewWithAppBar) {
                    return const SizedBox();
                  }
                  return HomeAppbarContainer(
                      onDropDownTapped: onDropDownTapped);
                }),
            DraggableScrollableSheet(
              snap: true,
              controller: draggableScrollController,
              minChildSize: getMinSizeDraggableSheetValue(screenHeight),
              maxChildSize:
                  getMaxSizeDraggableSheetValue(screenHeight, topPadding),
              snapSizes: {
                getStepSizeLowDraggableSheetValue(screenHeight, bottomPadding),
                getStepSizeMidDraggableSheetValue(screenHeight, bottomPadding),
                getStepSizeHighDraggableSheetValue(screenHeight),
              }.toList(),
              initialChildSize: getStepSizeLowDraggableSheetValue(
                  screenHeight, bottomPadding),
              builder: (context, scrollController) {
                return getMobileView(context, scrollController);
              },
            ),
            BlocBuilder<HomeScrollBloc, HomeScrollStateUpdate>(
              bloc: homeScrollBloc,
              builder: (context, state) {
                if (state.stepState == ScrollStepState.showButtonOnly) {
                  return HomeListButtonWidget(
                    onTap: onAppListViewButtonTapped,
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// [getMobileView] will show the Ui Inside the [DraggableScrollableSheet]
  Widget getMobileView(context, ScrollController scrollController) {
    return BlocBuilder<HomeScrollBloc, HomeScrollStateUpdate>(
      bloc: homeScrollBloc,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: context.theme.appColors.kPrimaryDark
                    .withOpacity(_boxShadowOpacity),
                blurRadius: _boxShadowBlurRadius,
                offset: _boxShadowOffset,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: homeScrollBloc.state.stepState ==
                    ScrollStepState.showListViewWithAppBar
                ? borderRadiusZero
                : borderRadiusEight,
            child: Container(
              color: context.theme.appColors.kWhiteColor,
              child: BlocConsumer<HomeScreenBloc, HomeState>(
                bloc: homeScreenBloc,
                listenWhen: (previous, current) {
                  return current is HomeStateSelectedState;
                },
                listener: (BuildContext context, HomeState homeState) async {
                  moveInMap(homeState);
                },
                buildWhen: (previous, current) {
                  return current is HomeStateLoaded;
                },
                builder: (BuildContext context, HomeState homeState) {
                  return ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    controller: scrollController,
                    children: [
                      HomeTransitionWidget(
                        homeState: homeState,
                        homeScrollStateUpdate: state,
                        onDropDownTapped: onDropDownTapped,
                        onLocationTapped: onLocationTapped,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
