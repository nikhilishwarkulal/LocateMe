import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locateme/core/exception/exception.dart';
import 'package:locateme/domain/get_location/models/location_argument_data.dart';
import 'package:locateme/domain/get_location/models/location_event_data.dart';
import 'package:locateme/domain/get_location/usecases/location_event_use_cases.dart';
import 'package:locateme/get_it.dart';

import 'home_event.dart';
import 'home_state.dart';

/// [HomeScreenBloc] will handle screen data
class HomeScreenBloc extends Bloc<HomeEvent, HomeState> {
  HomeScreenBloc() : super(const HomeStateLoading(listOfLocations: [])) {
    on<HomeEventLoadData>(_onLoadMainPage);
    on<HomeEventOnSelect>(_onHomeEventOnSelect);
  }

  /// [_onHomeEventOnSelect] when list item is tapped
  void _onHomeEventOnSelect(
      HomeEventOnSelect event, Emitter<HomeState> emit) async {
    emit(
      HomeStateSelectedState(
        listOfLocations: state.listOfLocations,
        selectedLocation: event.selectedModel,
      ),
    );
  }

  /// [_onLoadMainPage] when page is loaded
  void _onLoadMainPage(HomeEventLoadData event, Emitter<HomeState> emit) async {
    /// [LocationEventUseCases] get use case implementation
    LocationEventUseCases loginEventUseCases = getIt<LocationEventUseCases>();
    Either<ServerException, LocationData>? result = await loginEventUseCases
        .getLocationData(argumentModel: LocationArgumentModel());
    if (result?.isRight ?? false) {
      List<Result> finalResult = result?.right.results ?? [];
      emit(HomeStateLoaded.fromResult(finalResult));
    }
  }
}
