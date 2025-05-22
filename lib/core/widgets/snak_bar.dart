import 'package:flutter/material.dart';
import 'package:zbooma/core/utiles/route_utils/route_utils.dart';
import 'package:zbooma/style/color.dart';

void showSnackBar(
  String message, {
  bool isError = false,
  Color succColor = AppColors.green,
}) {
  ScaffoldMessenger.of(RouteUtils.context).hideCurrentSnackBar();
  ScaffoldMessenger.of(RouteUtils.context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : succColor,
      duration: const Duration(seconds: 3),
    ),
  );
}
