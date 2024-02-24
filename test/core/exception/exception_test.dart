import 'package:flutter_test/flutter_test.dart';
import 'package:locateme/core/exception/exception.dart';

void main() {
  test('Check for server exception test', () async {
    final ServerException serverException = ServerException.failure();
    expect(serverException.exceptionType, ServerExceptionType.failure);
  });
  test('Check for server exception test', () async {
    final ServerException serverException = ServerException();
    expect(serverException.exceptionType, ServerExceptionType.unknown);
  });
}
