part of 'entities.dart';

class Person {
  final String firstname;
  final String lastname;
  final String? image;
  final Location? location;
  final String? email;
  final String? cell;
  final Gender? gender;
  final int? age;

  String get fullname => '$firstname $lastname';

  Person({
    required this.firstname,
    required this.lastname,
    this.image,
    this.location,
    this.email,
    this.cell,
    this.gender,
    this.age,
  });

  Person copyWith({
    String? firstname,
    String? lastname,
    String? image,
    Location? location,
    String? email,
    String? cell,
    Gender? gender,
    int? age,
  }) =>
      Person(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        image: image ?? this.image,
        location: location ?? this.location,
        email: email ?? this.email,
        cell: cell ?? this.cell,
        gender: gender ?? this.gender,
        age: age ?? this.age,
      );
}
