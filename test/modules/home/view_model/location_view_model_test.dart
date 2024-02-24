import 'package:flutter_test/flutter_test.dart';
import 'package:locateme/modules/home/view_model/location_view_model.dart';

void main() {
  test('view model test', () async {
    LocationViewModel locationViewModel = const LocationViewModel(
        url: "123", rating: 4, title: "title", lat: 12, long: 23);
    LocationViewModel locationViewModelCopy = const LocationViewModel(
        url: "123", rating: 4, title: "title", lat: 12, long: 23);
    expect(locationViewModel == locationViewModelCopy, true);
    expect(locationViewModel.props.length == 5, true);
  });
}
