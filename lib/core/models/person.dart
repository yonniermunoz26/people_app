part of 'models.dart';

class PersonModel {
  final String firstname;
  final String lastname;
  final String? image;
  final LocationModel? locationModel;
  final String? email;
  final String? cell;
  final Gender? gender;
  final int? age;

  PersonModel({
    required this.firstname,
    required this.lastname,
    this.image,
    this.locationModel,
    this.email,
    this.cell,
    this.gender,
    this.age,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        firstname:
            json["name"]?["first"] is String ? json["name"]["first"] : '',
        lastname: json["name"]?["last"] is String ? json["name"]["last"] : '',
        image: json["picture"]?["large"] is String
            ? json["picture"]["large"]
            : null,
        email: json["email"] is String ? json["email"] : null,
        cell: json["cell"] is String ? json["cell"] : null,
        gender: genderFromString(json["gender"]),
        locationModel: LocationModel.fromJson(json["location"]),
        age: json["dob"]?["age"] is int ? json["dob"]["age"] : null,
      );

  Person toEntity() => Person(
        firstname: firstname,
        lastname: lastname,
        image: image,
        location: locationModel?.toEntity(),
        email: email,
        cell: cell,
        gender: gender,
        age: age,
      );
}
