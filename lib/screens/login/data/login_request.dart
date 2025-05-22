import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> login(String phone, String password) async {
    const url = 'https://app.crmzbooma.com/Client/login';
    final response = await _dio.post(url, data: {
      'phoneNumber': phone,
      'password': password,
    });

    if (response.statusCode == 200) {
      return response.data is String
          ? Map<String, dynamic>.from(jsonDecode(response.data))
          : Map<String, dynamic>.from(response.data);
    } else {
      throw Exception('Failed to login');
    }
  }
}
