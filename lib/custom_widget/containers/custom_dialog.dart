import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:zbooma/custom_widget/Bottoms/custom_Bottoms.dart';
import 'package:zbooma/style/color.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.message,
    required this.confirmTitle,
    required this.onConfirm,
    this.onCancel,
  });

  static void show(
    BuildContext context, {
    required String message,
    String confirmTitle = 'Save',
    required void Function() onConfirm,
    void Function()? onCancel,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // ignore: deprecated_member_use
      barrierColor: AppColors.black.withOpacity(0.5),
      builder: (context) => AppDialog(
        message: message,
        confirmTitle: confirmTitle,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }

  final String message;
  final String confirmTitle;
  final void Function() onConfirm;
  final void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xff212121),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 24.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            Text("تسجيل الخروج",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  height: 1.5,
                )),

            // AppText(
            //   title: message,
            //   color: AppColors.lightTextColor,
            //   textAlign: TextAlign.center,
            // ),
            Text(message,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  height: 1.5,
                )),

            CustomButton(
              text: "تسجيل الخروج",
              onPressed: () {
                onConfirm();
              },
            ),

            CustomButton(
              text: "الالغاء",
              onPressed: () {
                if (onCancel == null) {
                  Navigator.pop(context);
                  return;
                }
                onCancel!();
              },
            ),
          ],
        ),
      ),
    );
  }
}
