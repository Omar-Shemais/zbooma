// import 'package:dio/dio.dart';

// class UserService {
//   final Dio _dio = Dio();

//   Future<Map<String, dynamic>?> fetchUserData(int userId, String token) async {
//     final response = await _dio.get(
//       'https://app.crmzbooma.com/Client/getById/$userId',
//       options: Options(
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//       ),
//     );
//     return response.data;
//   }
// }
