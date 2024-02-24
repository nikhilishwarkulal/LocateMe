import 'dart:convert';

/// This is the modal that will be returned back to
/// the modules.
class LocationData {
  final List<Result>? results;

  LocationData({
    this.results,
  });

  factory LocationData.fromRawJson(String str) =>
      LocationData.fromJson(json.decode(str));

  factory LocationData.fromJson(Map<String, dynamic> json) => LocationData(
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );
}

class Result {
  final String? title;
  final String? imageUrl;
  final int? starRating;
  final double? locationLat;
  final double? locationLong;

  Result({
    this.title,
    this.imageUrl,
    this.starRating,
    this.locationLat,
    this.locationLong,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        imageUrl: json["image_url"],
        starRating: json["star_rating"],
        locationLat: json["location_lat"]?.toDouble(),
        locationLong: json["location_long"]?.toDouble(),
      );
}
