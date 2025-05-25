import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> login(String phone, String password) async {
    const url = 'https://app.crmzbooma.com/Client/login';

    // ✅ تحقق من الاتصال بالإنترنت قبل بدء الطلب
    final isConnected =
        await InternetConnectionChecker.createInstance().hasConnection;

    if (!isConnected) {
      print('❌ No internet connection detected.');
      throw Exception('لا يوجد اتصال بالإنترنت');
    }

    try {
      final response = await _dio.post(url, data: {
        'phoneNumber': phone,
        'password': password,
      });

      if (response.statusCode == 200) {
        return response.data is String
            ? Map<String, dynamic>.from(jsonDecode(response.data))
            : Map<String, dynamic>.from(response.data);
      } else {
        // throw Exception('خطأ غير متوقع في السيرفر');
        throw Exception(
            'e.statusCode: ${response.statusCode}, message: ${response.statusMessage}');
      }
    } on SocketException {
      print('❌ SocketException: No Internet');
      throw Exception('تحقق من اتصال الإنترنت');
    } on DioException catch (e) {
      // ... نفس معالجة الأخطاء السابقة ...
      // throw Exception('حدث خطأ أثناء الاتصال بالسيرفر');
      throw Exception(' ${e.response?.data['message']}');
    } catch (e) {
      print('❌ Generic Error: $e');
      throw Exception('حدث خطأ غير متوقع: ${e.toString()}');
    }
  }
}
