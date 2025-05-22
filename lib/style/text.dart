import 'package:flutter/material.dart';

import 'package:zbooma/style/color.dart';

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: AppColors.green,
    fontFamily: 'Roboto',
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: AppColors.green,
    fontFamily: 'Roboto',
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.green,
    fontFamily: 'Roboto',
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w900,
    color: AppColors.white,
    fontFamily: 'Roboto',
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Roboto',
  );
  static TextStyle data = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w900,
    color: AppColors.green,
    fontFamily: 'Roboto',
  );

  static const TextStyle texttrip = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 131, 129, 129),
    fontFamily: 'Roboto',
  );

  static TextStyle customStyle({
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    String fontFamily = 'Roboto',
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
    );
  }
}
