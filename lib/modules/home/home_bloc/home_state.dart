import 'package:equatable/equatable.dart';
import 'package:locateme/domain/get_location/models/location_event_data.dart';

import '../view_model/location_view_model.dart';

abstract class HomeState extends Equatable {
  final List<LocationViewModel> listOfLocations;
  const HomeState({
    required this.listOfLocations,
  });
}

///[HomeStateLoading] loading screen state
class HomeStateLoading extends HomeState {
  const HomeStateLoading({
    required super.listOfLocations,
  });

  @override
  List<Object> get props => [...listOfLocations];
}

class HomeStateLoaded extends HomeState {
  const HomeStateLoaded({
    required super.listOfLocations,
  });

  factory HomeStateLoaded.fromResult(List<Result> results) {
    return HomeStateLoaded(
      listOfLocations: results
          .map<LocationViewModel>(
            (e) => LocationViewModel(
              url: e.imageUrl ?? "",
              rating: e.starRating ?? 0,
              title: e.title ?? "",
              lat: e.locationLat ?? 0,
              long: e.locationLong ?? 0,
            ),
          )
          .toList(),
    );
  }
  @override
  List<Object> get props => [...listOfLocations];
}

///[HomeStateLoading] loading screen state
class HomeStateSelectedState extends HomeState {
  final LocationViewModel selectedLocation;
  const HomeStateSelectedState(
      {required super.listOfLocations, required this.selectedLocation});

  @override
  List<Object> get props => [...listOfLocations, selectedLocation];
}
