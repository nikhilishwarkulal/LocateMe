import 'package:equatable/equatable.dart';
import 'package:locateme/modules/home/view_model/location_view_model.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

/// [_onLoadMainPage] when page is loaded
class HomeEventLoadData extends HomeEvent {
  const HomeEventLoadData();

  @override
  List<Object?> get props => [];
}

/// [_onHomeEventOnSelect] when list item is tapped
class HomeEventOnSelect extends HomeEvent {
  final LocationViewModel selectedModel;
  const HomeEventOnSelect({required this.selectedModel});

  @override
  List<Object?> get props => [];
}
