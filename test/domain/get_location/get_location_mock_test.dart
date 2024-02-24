import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locateme/core/dio/dio.dart';
import 'package:locateme/core/exception/exception.dart';
import 'package:locateme/domain/get_location/data_sources/location_remote_data_source.dart';
import 'package:locateme/domain/get_location/models/location_argument_data.dart';
import 'package:locateme/domain/get_location/models/location_event_data.dart';
import 'package:locateme/domain/get_location/repositories/location_event_repository_impl.dart';
import 'package:locateme/domain/get_location/usecases/location_event_use_cases.dart';

void main() {
  test('Domain get location mock', () async {
    LocationEventUseCases locationEventUseCases = LocationEventUseCasesImpl();
    Either<ServerException, LocationData>? result = await locationEventUseCases
        .getLocationData(argumentModel: LocationArgumentModel());
    expect(result!.right.results?.length, 5);
  });

  test('Domain get location network datasource test', () async {
    LocationEventUseCases locationEventUseCases = LocationEventUseCasesImpl(
      repository: LocationEventRepositoryImpl(
        remoteDataSource: LocationRemoteDataSourceImpl(dio: TestingDio()),
      ),
    );
    Either<ServerException, LocationData>? result = await locationEventUseCases
        .getLocationData(argumentModel: LocationArgumentModel());
    expect(result!.isLeft, true);
    expect(result.left.exceptionType, ServerExceptionType.failure);
  });
}

class TestingDio implements CustomDio {
  @override
  Future<String> callApiGet(
      {String? customUrl, required Map<String, dynamic> getDataAsMap}) {
    // TODO: implement callApiGet
    throw ServerException();
  }

  @override
  Future<String> callApiPost(
      {String? customUrl, required Map<String, dynamic> jsonDataAsMap}) {
    // TODO: implement callApiPost
    throw ServerException();
  }
}
