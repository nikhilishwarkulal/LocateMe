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

  String toRawJson() => json.encode(toJson());

  factory LocationData.fromJson(Map<String, dynamic> json) => LocationData(
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
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

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        imageUrl: json["image_url"],
        starRating: json["star_rating"],
        locationLat: json["location_lat"]?.toDouble(),
        locationLong: json["location_long"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image_url": imageUrl,
        "star_rating": starRating,
        "location_lat": locationLat,
        "location_long": locationLong,
      };
}
