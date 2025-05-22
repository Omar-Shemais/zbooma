import 'package:flutter/material.dart';

double width(BuildContext context, double ratio) {
  return MediaQuery.of(context).size.width * ratio;
}

double height(BuildContext context, double ratio) {
  return MediaQuery.of(context).size.height * ratio;
}

// class Paddingbody {
//   static EdgeInsetsGeometry mainpadding =
//       const EdgeInsets.symmetric(horizontal: 20);
// }



// class AppTextStyle {
//   static TextStyle? maintextblack900 = TextStyle(
//       fontWeight: FontWeight.w700, fontSize: 24, color: AppColor.mainblack900);}