import 'package:flutter/material.dart';
import 'package:people_app/core/enums/enums.dart';

class IconFrom {
  static IconData gender(Gender? gender) {
    switch (gender) {
      case Gender.male:
        return Icons.male;
      case Gender.female:
        return Icons.female;
      default:
        return Icons.face_unlock_rounded;
    }
  }
}
