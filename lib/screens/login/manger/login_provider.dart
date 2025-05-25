import 'package:flutter/material.dart';
import 'package:zbooma/core/utiles/storage_service/storage_service.dart';
import 'package:zbooma/screens/login/data/login_request.dart';

class LoginProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final StorageService _storageService = StorageService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<Map<String, String?>> loadSavedCredentials() {
    return _storageService.loadUserData();
  }

  Future<String?> login(String phone, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.login(phone, password);

      if (response.containsKey('error')) {
        return response['message'] ?? 'خطأ في البيانات';
      }

      if (response.containsKey('id') && response.containsKey('token')) {
        await _storageService.saveUserData(
            response['id'], response['token'], phone, password);
        return null; // Success
      } else {
        return 'بيانات المستخدم غير مكتملة';
      }
    } catch (e) {
      return e.toString().replaceAll('Exception: ', '');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
