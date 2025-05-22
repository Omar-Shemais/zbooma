import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
// import 'package:zbooma/screens/BottomNevgaterBar/BNB.dart';
import 'package:zbooma/screens/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), _handleStartUpLogic);
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

      // Proceed to main app
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (_) => BNB(userId: userId, token: token),
      //     ),
      //   );
      // } else {
      // Go to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LOGIN()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/splash.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
