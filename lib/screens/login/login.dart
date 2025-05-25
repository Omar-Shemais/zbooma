import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zbooma/core/utiles/route_utils/route_utils.dart';
import 'package:zbooma/core/widgets/snak_bar.dart';
import 'package:zbooma/custom_widget/Bottoms/custom_Bottoms.dart';
import 'package:zbooma/custom_widget/TextField/custom_textfeild.dart';
import 'package:zbooma/custom_widget/cards/custom_card.dart';
import 'package:zbooma/custom_widget/containers/jumping_avatar.dart';
import 'package:zbooma/screens/BottomNevgaterBar/BNB.dart';
import 'package:zbooma/screens/login/manger/login_provider.dart';
import 'package:zbooma/style/color.dart';
import 'package:zbooma/style/size.dart';
import 'package:zbooma/style/text.dart';

class LOGIN extends StatefulWidget {
  const LOGIN({super.key});

  @override
  State<LOGIN> createState() => _LOGINState();
}

class _LOGINState extends State<LOGIN> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<LoginProvider>(context, listen: false);
      provider.loadSavedCredentials().then((data) {
        setState(() {
          phoneController.text = data['phone'] ?? '';
          passwordController.text = data['password'] ?? '';
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
              child: Image.asset('assets/login.png', fit: BoxFit.cover)),
          Positioned(
            bottom: height(context, .06).h,
            left: width(context, .04).w,
            right: width(context, .04).w,
            child: SingleChildScrollView(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Custom_Card(
                    children: [
                      SizedBox(height: height(context, .03).h),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('تسجيل دخول',
                            style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.green)),
                      ),
                      SizedBox(height: height(context, .01).h),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text('رقم الهاتف',
                              style: AppTextStyles.bodyText2)),
                      SizedBox(height: height(context, .02)),
                      Custom_field(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        isPassword: false,
                        labelText: 'رقم الهاتف',
                        controller: phoneController,
                      ),
                      SizedBox(height: height(context, .02).h),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text('كلمة المرور',
                              style: AppTextStyles.bodyText2)),
                      SizedBox(height: height(context, .02).h),
                      Custom_field(
                        labelText: 'كلمة المرور',
                        controller: passwordController,
                        isPassword: true,
                      ),
                      SizedBox(height: height(context, .02).h),
                      CustomButton(
                        text: "تسجيل دخول",
                        isLoading: provider.isLoading,
                        onPressed: () async {
                          final phone = phoneController.text.trim();
                          final password = passwordController.text.trim();

                          if (phone.isEmpty || password.isEmpty) {
                            showSnackBar('يرجى إدخال البيانات', isError: true);
                            return;
                          }

                          final error = await provider.login(phone, password);
                          if (error == null) {
                            final prefs = await SharedPreferences.getInstance();
                            final userId = prefs.getInt('userId');
                            final token = prefs.getString('token');
                            if (userId != null && token != null) {
                              RouteUtils.puAshReplacement(
                                  BNB(userId: userId, token: token));
                            }
                          } else {
                            showSnackBar(error, isError: true);
                          }
                        },
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: FractionalTranslation(
                      translation: const Offset(-.1, -0.9),
                      child: const JumpingBird(),
                    ),
                  ),

                  // Positioned(
                  //   bottom: height(context, .32).h,
                  //   left: width(context, .20).w,
                  //   child: const JumpingBird(),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
