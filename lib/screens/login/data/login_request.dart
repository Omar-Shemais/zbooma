import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> login(String phone, String password) async {
    const url = 'https://app.crmzbooma.com/Client/login';

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
        throw Exception('خطأ غير متوقع في السيرفر');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('انتهت مهلة الاتصال بالخادم');
      } else if (e.type == DioExceptionType.badResponse) {
        final statusCode = e.response?.statusCode;
        final message = e.response?.data.toString();
        throw Exception('خطأ $statusCode: $message');
      } else if (e.type == DioExceptionType.unknown) {
        throw Exception('تحقق من اتصال الإنترنت');
      } else {
        throw Exception('حدث خطأ أثناء الاتصال بالخادم');
      }
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع: ${e.toString()}');
    }
  }
}
