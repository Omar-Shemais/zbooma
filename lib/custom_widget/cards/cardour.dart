import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zbooma/style/size.dart';

class OurCard extends StatelessWidget {
  const OurCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: height(context, .27).h,
      width: width(context, .9).w,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/1111.png"),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(20.r),
          border:
              Border.all(color: Colors.greenAccent.withOpacity(0.5), width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: height(context, .02).h),
            Text(
              "لماذا تختار شركة زبوما؟",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "مع زبوما، كل خطوة نحو النجاح ستجدها مدعومة بخبرتنا ورؤيتنا المبتكرة. انطلق معنا نحو آفاق جديدة، ونجعل من طموحاتك واقعاً ملموساً.",
              style: TextStyle(
                fontSize: 15.sp,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height(context, .01)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "32k",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                  ),
                ),
                Text(
                  "55",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                  ),
                ),
                Text(
                  "7+",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "دخول الموقع",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "عميل رئيسي",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "سنوات الخبرة",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: height(context, .02).h),
          ],
        ),
      ),
    );
  }
}
