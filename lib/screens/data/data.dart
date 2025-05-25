import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zbooma/core/widgets/snak_bar.dart';
import 'package:zbooma/custom_widget/containers/jumping_avatar.dart';

import 'package:zbooma/style/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DATA extends StatefulWidget {
  const DATA({Key? key}) : super(key: key);

  @override
  _DATAState createState() => _DATAState();
}

class _DATAState extends State<DATA> {
  Map<String, dynamic>? userData;
  bool isLoading = true;
  final Dio _dio = Dio();
  String? token;
  int? userId;

  @override
  void initState() {
    super.initState();
    loadUserCredentials();
  }

  Future<void> loadUserCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    String? storedToken = prefs.getString('token');
    int? storedUserId = prefs.getInt('userId');
    String? storedUserData = prefs.getString('userData');

    if (storedToken != null && storedUserId != null) {
      setState(() {
        token = storedToken;
        userId = storedUserId;
        if (storedUserData != null) {
          userData = jsonDecode(storedUserData);
        }
      });

      /// 🟢 إذا لم تكن البيانات المحفوظة موجودة، نقوم بجلبها من الـ API
      if (userData == null) {
        fetchUserData();
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('بيانات المستخدم غير متوفرة')),
      );
    }
  }

  Future<void> saveUserData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userData', jsonEncode(data));
    if (data['name'] != null) {
      await prefs.setString('userName', data['name']);
    }
  }

  Future<void> fetchUserData() async {
    if (token == null || userId == null) {
      print(" خطأ: لا يوجد userId أو token متاح لجلب البيانات!");
      return;
    }

    print(" بدء جلب بيانات العميل لـ userId: $userId");
    print(" Token being used: $token");
    try {
      final response = await _dio.get(
        'https://app.crmzbooma.com/Client/getById/$userId',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'.trim(),
          },
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          userData = response.data;
          isLoading = false;
        });

        await saveUserData(response.data);

        print(" تم استرجاع بيانات العميل بنجاح: ${response.data}");
      } else {
        setState(() {
          isLoading = false;
        });
        print(" خطأ في جلب البيانات: ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('فشل في تحميل البيانات')),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(" استثناء أثناء جلب البيانات: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('حدث خطأ أثناء جلب البيانات.')),
      );
    }
  }

  Future<void> refreshData() async {
    setState(() {
      isLoading = true;
    });
    await fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.h),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/data.png"),
              fit: BoxFit.cover,
            ),
          ),
          // color: Colors.black,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              children: [
                SizedBox(height: 35.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'مرحبا بك ,${userData?['name'] ?? 'غير متوفر'}',
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
                    SizedBox(width: 16.w),
                    JumpingAvatar()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/data.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.green),
                ),
              )
            : userData == null
                ? const Center(child: Text('فشل في تحميل البيانات'))
                : Column(
                    children: [
                      Divider(
                        height: 20.h,
                        thickness: 2,
                        color: Color(0xff09f9a3),
                      ),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () => refreshData(),
                          backgroundColor: Colors.transparent,
                          color: AppColors.green,
                          child: ListView(
                            children: [
                              _buildDataRow(userData?['name'], 'الاسم رباعي'),
                              _buildDataRow(
                                  userData?['phoneNumber'], 'رقم الهاتف'),
                              _buildDataRow(
                                  userData?['email'], 'البريد الإلكتروني'),
                              _buildDataRow(userData?['iban'], 'رقم IBAN'),
                              _buildDataRow(
                                  userData?['password'], 'كلمة المرور'),
                              _buildDataRow(userData?[' tbService']?[' name'],
                                  'نوع الخدمة'),
                              _buildDataRow(
                                  userData?['tbService']?['description'],
                                  'وصف الخدمة'),
                              _buildDataRow(userData?['tbPackage']?['name'],
                                  'نوع الباقة'),
                              _buildDataRow(
                                  userData?['tbPackage']?['description'],
                                  'وصف الباقة'),
                              _buildDataRow(userData?['tbHostType']?['name'],
                                  'نوع الهوست'),
                              _buildDataRow(
                                  userData?['tbHostType']?['description'],
                                  ' وصف الهوست'),
                              _buildDataRow(userData?['tbWebsite']?['name'],
                                  ' اسم الموقع'),
                              _buildDataRow(
                                userData?['tbWebsite']?['ulRName'],
                                'رابط الموقع',
                                isLink: true,
                                showDivider: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   padding: const EdgeInsets.all(10),
                      //   child: ElevatedButton(
                      //     onPressed: refreshData,
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: const Color(0xff0e2323),
                      //       padding: const EdgeInsets.symmetric(vertical: 15),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(8),
                      //         side: const BorderSide(color: AppColors.green),
                      //       ),
                      //     ),
                      //     child: const Text(
                      //       'تحديث البيانات',
                      //       style: TextStyle(
                      //         color: AppColors.green,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
      ),
    );
  }
}

Widget _buildDataRow(dynamic value, String label,
    {bool isLink = false, bool showDivider = true}) {
  if (value == null || value.toString().trim().isEmpty) {
    return const SizedBox.shrink();
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.rtl,
          children: [
            Text(
              ": $label ",
              style: TextStyle(
                color: AppColors.green,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: isLink
                  ? InkWell(
                      onTap: () => _launchURL(value.toString().trim()),
                      child: Text(
                        "LINK🔗",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 13.sp,
                        ),
                      ),
                    )
                  : Text(
                      value.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
            ),
          ],
        ),
      ),
      if (showDivider) ...[
        SizedBox(height: 2.h),
        Divider(
          endIndent: 15.w,
          indent: 15.w,
          height: 1,
          thickness: 1,
          color: Colors.grey.withAlpha(128),
        ),
      ],
    ],
  );
}

Future<void> _launchURL(String url) async {
  try {
    final Uri uri = Uri.parse(url.trim());
    // final Uri uri = Uri.parse('https://google.com');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print("❌ لا يمكن فتح الرابط: $url");
      showSnackBar("❌ لا يمكن فتح الرابط: $url", isError: true);
    }
  } catch (e) {
    print("🚫 خطأ في الرابط: $e");
  }
}
