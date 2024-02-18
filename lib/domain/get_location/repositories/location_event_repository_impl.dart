import 'package:either_dart/either.dart';
import 'package:locateme/domain/get_location/data_sources/location_mock_data_source.dart';

import '../../../core/exception/exception.dart';
import '../data_sources/location_remote_data_source.dart';
import '../models/location_argument_data.dart';
import '../models/location_event_data.dart';

/// Interface for [LocationEventRepository] repository.
abstract class LocationEventRepository {
  /// Call API to get the Search Listing Screen.
  ///
  /// [Either<ServerException, LocationData>] to handle the Failure or result data.
  Future<Either<ServerException, LocationData>> getLocationData(
      {required LocationArgumentModel argumentModel});
}

/// [LocationEventRepositoryImpl] will contain the [LocationEventRepository] implementation.
class LocationEventRepositoryImpl implements LocationEventRepository {
  LocationDataSource? eventRemoteDataSource;

  /// Dependence injection via constructor
  LocationEventRepositoryImpl({LocationDataSource? remoteDataSource}) {
    if (remoteDataSource == null) {
      eventRemoteDataSource = LocationMockDataSourceImpl();
    } else {
      eventRemoteDataSource = remoteDataSource;
    }
  }

  /// Call API to get the chat Screen.
  ///
  /// [LocationArgumentModel] is the query that user entered in search.
  /// [Either<ServerException, LocationData>] to handle the Failure or result data.
  @override
  Future<Either<ServerException, LocationData>> getLocationData(
      {required LocationArgumentModel argumentModel}) async {
    try {
      final splashResult = await eventRemoteDataSource?.getLocationData(
          argumentModel: argumentModel);
      return Right(splashResult!);
    } on ServerException catch (error) {
      return Left(error);
    }
  }
}
