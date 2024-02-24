import 'package:get_it/get_it.dart';
import 'package:locateme/domain/get_location/usecases/location_event_use_cases.dart';

import 'modules/home/home_scroll_bloc/home_scroll_bloc.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<LocationEventUseCases>(LocationEventUseCasesImpl());
  getIt.registerSingleton<HomeScrollBloc>(HomeScrollBloc());
}
