import 'package:flutter_test/flutter_test.dart';
import 'package:locateme/common/app_routes.dart';

void main() {
  test('Get routes test', () async {
    expect(AppRoutes.getRoutes().containsKey(AppRoutes.splashScreen), true);
    expect(AppRoutes.getRoutes().containsKey(AppRoutes.homeScreen), true);
    expect(AppRoutes.getRoutes().length, 2);
  });
}
