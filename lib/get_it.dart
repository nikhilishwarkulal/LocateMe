import 'package:get_it/get_it.dart';
import 'package:locateme/domain/get_location/usecases/location_event_use_cases.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<LocationEventUseCases>(LocationEventUseCasesImpl());
}
