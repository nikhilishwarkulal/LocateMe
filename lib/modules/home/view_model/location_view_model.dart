import 'package:equatable/equatable.dart';

/// [LocationViewModel] will store the screen data
class LocationViewModel extends Equatable {
  final String url;
  final String title;
  final int rating;
  final double lat;
  final double long;
  const LocationViewModel(
      {required this.url,
      required this.rating,
      required this.title,
      required this.lat,
      required this.long});
  @override
  // TODO: implement props
  List<Object?> get props => [
        url,
        title,
        rating,
        lat,
        long,
      ];
}
