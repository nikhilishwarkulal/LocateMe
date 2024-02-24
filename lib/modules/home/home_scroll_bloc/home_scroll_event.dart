import 'package:equatable/equatable.dart';

abstract class HomeScrollEvent extends Equatable {
  const HomeScrollEvent();
}

///[HomeScrollStateUpdate] when scroll changes from timer
class HomeScrollEventCaptured extends HomeScrollEvent {
  const HomeScrollEventCaptured({
    required this.scrollableSizeValue,
    required this.screenSize,
    required this.bottomPadding,
    required this.topPadding,
  });
  final double scrollableSizeValue;
  final double screenSize;
  final double bottomPadding;
  final double topPadding;
  @override
  List<Object?> get props =>
      [scrollableSizeValue, screenSize, bottomPadding, topPadding];
}

///[HomeScrollStateUpdate] when scroll changes from timer
class HomeScrollEventUpdate extends HomeScrollEvent {
  const HomeScrollEventUpdate({
    required this.scrollableSizeValue,
    required this.screenSize,
    required this.bottomPadding,
    required this.topPadding,
  });
  final double Function() scrollableSizeValue;
  final double screenSize;
  final double bottomPadding;
  final double topPadding;
  @override
  List<Object?> get props =>
      [scrollableSizeValue, screenSize, bottomPadding, topPadding];
}
