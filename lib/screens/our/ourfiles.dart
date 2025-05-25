import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:zbooma/core/utiles/storage_service/storage_service.dart';
import 'package:zbooma/custom_widget/cards/cardour.dart';
import 'package:zbooma/custom_widget/containers/containerour.dart';
import 'package:zbooma/custom_widget/containers/jumping_avatar.dart';
// import 'package:zbooma/screens/data/manger/user_provider.dart';
import 'package:zbooma/screens/screens%20of%20our/brand.dart';
import 'package:zbooma/screens/screens%20of%20our/graphic.dart';
import 'package:zbooma/screens/screens%20of%20our/marking.dart';
import 'package:zbooma/screens/screens%20of%20our/programming.dart';
import 'package:zbooma/screens/screens%20of%20our/searsh.dart';
import 'package:zbooma/screens/screens%20of%20our/socialmedia.dart';
import 'package:zbooma/style/color.dart';
import 'package:zbooma/style/size.dart';

class Ourfiles extends StatefulWidget {
  const Ourfiles({super.key});

  @override
  State<Ourfiles> createState() => _OurfilesState();
}

class _OurfilesState extends State<Ourfiles> {
  String? userName;

  @override
  void initState() {
    super.initState();
    loadCachedName();
    _handleStartUpLogic();
  }

  Future<void> _handleStartUpLogic() async {
    final prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('userId');
    final String? token = prefs.getString('token');

    if (userId != null && token != null) {
      try {
        final dio = Dio();
        final response = await dio.get(
          'https://app.crmzbooma.com/Client/getById/$userId',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),
        );

        if (response.statusCode == 200 && response.data != null) {
          final userData = response.data;
          await prefs.setString('userName', userData['name'] ?? 'زائر');
          await prefs.setString('userData', jsonEncode(userData));
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    }
  }

  Future<void> refreshData() async {
    setState(() {});
    _handleStartUpLogic();
  }

  Future<void> loadCachedName() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedName = prefs.getString('userName');
    // print("✅ Loaded userName: $cachedName");

    setState(() {
      userName = cachedName ?? 'زائر';
    });
  }

  Map<String, dynamic>? userData;
  @override
  Widget build(BuildContext context) {
    // final userName = Provider.of<UserProvider>(context).userName;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.h),
        child: Container(
          color: Color(0xff0f1f21),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'مرحبا بك ${userName ?? ''}',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: AppColors.green,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'هنا تبدأ رحلتك نحو نجاح متجرك',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: AppColors.green,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    JumpingAvatar(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        color: AppColors.green,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/data.png"),
              fit: BoxFit.cover,
            ),
          ),
          height: height(context, 1),
          width: width(context, 1),
          child: Column(
            children: [
              Divider(
                height: height(context, .02),
                thickness: 2,
                color: Color(0xff09f9a3),
              ),
              SizedBox(height: height(context, .01)),
              OurCard(),
              SizedBox(height: height(context, .05)),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: GridView.count(
                      childAspectRatio: 0.8,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => search(),
                            ),
                          ),
                          child: CustomCard(
                            title: "تحسين محركات البحث",
                            description:
                                "تصدر الصفحات الأولى في نتائج محركات البحث",
                            image: AssetImage("assets/101.png"),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Programming(),
                            ),
                          ),
                          child: CustomCard(
                            title: "برمجة",
                            description: "خدمات برمجية مبتكرة خصيصًا لمتجرك",
                            image: AssetImage("assets/102.png"),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => marketing(),
                            ),
                          ),
                          child: CustomCard(
                            title: "حملات اعلانيه",
                            description:
                                " حقق المزيد من الارباح المتفاوته من خلال نظام تسويقي قوي ",
                            image: AssetImage("assets/103.png"),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => graphic(),
                            ),
                          ),
                          child: CustomCard(
                            title: "تصميمات الجرافيك",
                            description: "جزا بل يتجزا من نجاح عمليه التسويق ",
                            image: AssetImage("assets/104.png"),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Socialmedia(),
                            ),
                          ),
                          child: CustomCard(
                            title: "إدارة حسابات السوشيال ميديا",
                            description:
                                "خدمات برمجيه مبتكره خصيصا لمتجرك الاكتروني ",
                            image: AssetImage("assets/105.png"),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Brand(),
                            ),
                          ),
                          child: CustomCard(
                            title: "تطوير العلامة التجارية",
                            description:
                                "تعزيز الظهور الرقمي في سوق التجاره الاكترونيه ",
                            image: AssetImage("assets/106.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
