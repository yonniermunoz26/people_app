part of 'entities.dart';

class Location {
  final double? latitude;
  final double? longitude;
  final String? country;
  final String? state;
  final String? name;

  String get fullLocation => '$name, $state, $country';

  Location({
    this.latitude,
    this.longitude,
    this.country,
    this.state,
    this.name,
  });

  Location copyWith({
    double? latitude,
    double? longitude,
    String? country,
    String? state,
    String? name,
  }) =>
      Location(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        country: country ?? this.country,
        state: state ?? this.state,
        name: name ?? this.name,
      );
}
