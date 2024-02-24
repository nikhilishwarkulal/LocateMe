import '../../../common/app_constants.dart';
import '../../../core/dio/dio.dart';
import '../../../core/exception/exception.dart';
import '../models/location_argument_data.dart';
import '../models/location_event_data.dart';

/// Interface for Chat Data remote data source.
abstract class LocationDataSource {
  /// Call API to get the Chat Screen.
  /// [Future<LocationData>] to handle the Failure or result data.
  Future<LocationData> getLocationData(
      {required LocationArgumentModel argumentModel});
}

/// [LocationRemoteDataSourceImpl] will contain the [LocationDataSource] implementation.
class LocationRemoteDataSourceImpl implements LocationDataSource {
  late CustomDio customDio;

  LocationRemoteDataSourceImpl({CustomDio? dio}) {
    if (dio == null) {
      customDio = CustomDioImpl(baseUrl: AppConstants.baseUrl);
    } else {
      customDio = dio;
    }
  }

  /// Call API to get the Location Listing Items.
  ///
  /// [Future<LocationData>] to handle the Failure or result data.
  /// TODO: Implement your API call.
  @override
  Future<LocationData> getLocationData(
      {required LocationArgumentModel argumentModel}) async {
    try {
      final String result = await customDio.callApiPost(
        customUrl: "${AppConstants.baseUrl}profile/login",
        jsonDataAsMap: argumentModel.toMap(),
      );
      return LocationData.fromRawJson(result);
    } catch (ex) {
      throw ServerException.failure();
    }
  }
}
