import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final ImageProvider<Object> image;

  const CustomCard({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Color(0xff212829),
          borderRadius: BorderRadius.circular(15.r),
          // border: Border.all(color: Colors.green, width: 2.w),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.3),
              blurRadius: 1.r,
              spreadRadius: 1.r,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60.h,
              width: 60.w,
              child: Image(image: image),
            ),
            SizedBox(height: 8.h),
            Divider(
              color: Colors.grey,
              thickness: 1.h,
            ),
            SizedBox(height: 4.h),
            Text(
              title,
              style: TextStyle(
                color: Colors.green,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 4.h),
            Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(), // Pushes arrow button to bottom of card
            Align(
              alignment: Alignment.bottomCenter,
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 13.r,
                child:
                    Icon(Icons.arrow_forward, color: Colors.black, size: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
