import 'package:either_dart/either.dart';

import '../../../core/exception/exception.dart';
import '../models/location_argument_data.dart';
import '../models/location_event_data.dart';
import '../repositories/location_event_repository_impl.dart';

/// Interface for [LocationEventUseCases] cases.
abstract class LocationEventUseCases {
  /// Call API to get the Search Listing Item.
  ///
  /// [Either<ServerException, LocationData>] to handle the Failure or result data.
  Future<Either<ServerException, LocationData>?> getLocationData(
      {required LocationArgumentModel argumentModel});
}

/// [LocationEventUseCasesImpl] will contain the [LocationEventUseCases] implementation.
class LocationEventUseCasesImpl implements LocationEventUseCases {
  LocationEventRepository? eventRepository;

  /// Dependence injection via constructor
  LocationEventUseCasesImpl({LocationEventRepository? repository}) {
    if (repository == null) {
      eventRepository = LocationEventRepositoryImpl();
    } else {
      eventRepository = repository;
    }
  }

  /// Call API to get the Search Listing Item.
  ///
  /// [Either<ServerException, LocationData>] to handle the Failure or result data.
  @override
  Future<Either<ServerException, LocationData>?> getLocationData(
      {required LocationArgumentModel argumentModel}) async {
    return await eventRepository?.getLocationData(argumentModel: argumentModel);
  }
}
