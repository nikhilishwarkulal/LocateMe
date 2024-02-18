import 'package:equatable/equatable.dart';

///[HomeScrollStateUpdate] when scroll changes from timer
class HomeScrollStateUpdate extends Equatable {
  final ScrollStepState stepState;
  const HomeScrollStateUpdate({
    required this.stepState,
  });
  factory HomeScrollStateUpdate.initial() {
    return const HomeScrollStateUpdate(
      stepState: ScrollStepState.doNotShowAnything,
    );
  }

  @override
  List<Object> get props => [stepState];
}

enum ScrollStepState {
  doNotShowAnything,
  showButtonOnly,
  showOnlyImageCard,
  showCardWithTitle,
  showListView,
  showListViewWithAppBar,
}
