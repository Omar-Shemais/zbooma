import 'package:flutter/material.dart';

class AppPadding {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;

  static const EdgeInsets allSmall = EdgeInsets.all(small);
  static const EdgeInsets allMedium = EdgeInsets.all(medium);
  static const EdgeInsets allLarge = EdgeInsets.all(large);

  static const EdgeInsets horizontalSmall =
      EdgeInsets.symmetric(horizontal: small);
  static const EdgeInsets horizontalMedium =
      EdgeInsets.symmetric(horizontal: medium);
  static const EdgeInsets horizontalLarge =
      EdgeInsets.symmetric(horizontal: large);

  static const EdgeInsets verticalSmall = EdgeInsets.symmetric(vertical: small);
  static const EdgeInsets verticalMedium =
      EdgeInsets.symmetric(vertical: medium);
  static const EdgeInsets verticalLarge = EdgeInsets.symmetric(vertical: large);

  static const EdgeInsets customPadding =
      EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0);
}
