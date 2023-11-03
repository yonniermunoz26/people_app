part of 'enums.dart';

enum Gender {
  male,
  female,
}

Gender? genderFromString(String? gender) {
  switch (gender?.toLowerCase()) {
    case "male":
      return Gender.male;
    case "female":
      return Gender.female;
    default:
      return null;
  }
}
