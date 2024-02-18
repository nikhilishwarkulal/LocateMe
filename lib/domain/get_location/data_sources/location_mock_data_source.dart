import '../models/location_argument_data.dart';
import '../models/location_event_data.dart';
import 'location_remote_data_source.dart';

class LocationMockDataSourceImpl implements LocationDataSource {
  /// [LocationMockDataSourceImpl] will provide user with mock
  /// Api response to user.
  LocationMockDataSourceImpl();

  static String getMockData() {
    return _responseMock;
  }

  /// Mock response given to The mobile screen.
  /// [Future<LocationData>] to handle the Failure or result data.
  @override
  Future<LocationData> getLocationData(
      {required LocationArgumentModel argumentModel}) async {
    await Future.delayed(const Duration(seconds: 2));
    return LocationData.fromRawJson(_responseMock);
  }
}

/// Mock json data
var _responseMock = """
{
  "results": [
    {
      "title": "21 of the Most Beautiful Places in India | Travel",
      "image_url": "https://luckyapp.in/test/1.jpg",
      "star_rating": 3,
      "location_lat": 3.5,
      "location_long": 3.5
    },
    {
      "title": "Green place for trees. | Beautiful nature wallpaper,",
      "image_url": "https://luckyapp.in/test/2.jpg",
      "star_rating": 4,
      "location_lat": 12.5,
      "location_long": 12.5
    },
    {
      "title": "5 of the Greenest Places in the World",
      "image_url": "https://luckyapp.in/test/3.jpg",
      "star_rating": 2,
      "location_lat": 22.5,
      "location_long": 22.5
    },
    {
      "title": "Beautiful Green place.n5 image uploaded on Jan",
      "image_url": "https://luckyapp.in/test/4.jpg",
      "star_rating": 5,
      "location_lat": 44.5,
      "location_long": 44.5
    },
    {
      "title": "HD beautiful place grass wallpapers | Peakpx",
      "image_url": "https://luckyapp.in/test/5.jpg",
      "star_rating": 3,
      "location_lat": 55.5,
      "location_long": 66.5
    }
  ]
}
""";
