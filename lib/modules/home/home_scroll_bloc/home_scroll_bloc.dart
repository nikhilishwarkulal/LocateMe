import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locateme/modules/home/helper/home_helper.dart';

import '../../../common/bloc_initalizer.dart';
import 'home_scroll_event.dart';
import 'home_scroll_state.dart';

class HomeScrollBloc extends Bloc<HomeScrollEvent, HomeScrollStateUpdate>
    with HomeHelper, BlocInitialize {
  HomeScrollBloc() : super(HomeScrollStateUpdate.initial()) {
    initialize();
  }
  @override
  void initialize() {
    on<HomeScrollEventCaptured>(_onHomeScrollEventCaptured);
    on<HomeScrollEventUpdate>(_onHomeScrollEventUpdate);
  }

  /// [_onHomeScrollEventUpdate] maintains a loop to continuesly check for the
  /// scroll updates.
  void _onHomeScrollEventUpdate(
      HomeScrollEventUpdate event, Emitter<HomeScrollStateUpdate> emit) async {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      add((HomeScrollEventCaptured(
        scrollableSizeValue: event.scrollableSizeValue(),
        topPadding: event.topPadding,
        bottomPadding: event.bottomPadding,
        screenSize: event.screenSize,
      )));
    });
  }

  /// [_onHomeScrollEventCaptured] will be called when there is scrolling
  /// but here we have timer to make sure if we miss the scrolling event.
  /// to get the last scroll position. based on the scroll postion
  /// widget will be rendered
  void _onHomeScrollEventCaptured(HomeScrollEventCaptured event,
      Emitter<HomeScrollStateUpdate> emit) async {
    if (event.scrollableSizeValue >=
        getMaxSizeDraggableSheetValue(event.screenSize, event.topPadding) -
            0.005) {
      emit(const HomeScrollStateUpdate(
          stepState: ScrollStepState.showListViewWithAppBar));
    } else if (event.scrollableSizeValue >
        getStepSizeMidDraggableSheetValue(
                event.screenSize, event.bottomPadding) +
            0.005) {
      emit(
          const HomeScrollStateUpdate(stepState: ScrollStepState.showListView));
    } else if (event.scrollableSizeValue >
        getStepSizeLowDraggableSheetValue(
                event.screenSize, event.bottomPadding) +
            0.005) {
      emit(const HomeScrollStateUpdate(
          stepState: ScrollStepState.showCardWithTitle));
    } else if (event.scrollableSizeValue >
        getMinSizeDraggableSheetValue(event.screenSize) + 0.005) {
      emit(const HomeScrollStateUpdate(
          stepState: ScrollStepState.showOnlyImageCard));
    } else {
      emit(const HomeScrollStateUpdate(
          stepState: ScrollStepState.showButtonOnly));
    }
  }
}
