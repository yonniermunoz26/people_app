part of 'models.dart';

class LocationModel {
  final double? latitude;
  final double? longitude;
  final String? country;
  final String? state;
  final String? name;

  LocationModel({
    this.latitude,
    this.longitude,
    this.country,
    this.state,
    this.name,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        latitude: double.tryParse(json["coordinates"]?["latitude"] ?? ""),
        longitude: double.tryParse(json["coordinates"]?["longitude"] ?? ""),
        country: json["country"],
        state: json["state"],
        name: json["street"]?["name"],
      );

  Location toEntity() => Location(
        latitude: latitude,
        longitude: longitude,
        country: country,
        state: state,
        name: name,
      );
}
