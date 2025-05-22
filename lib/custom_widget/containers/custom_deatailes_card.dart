import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDeatailesCard extends StatelessWidget {
  final String title;
  final String description;
  final double? width;
  final EdgeInsetsGeometry? padding;

  const CustomDeatailesCard({
    Key? key,
    required this.title,
    required this.description,
    this.width,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.45,
      padding: padding ?? EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF03110F),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF09F9A3), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF09F9A3),
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 11.sp,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
