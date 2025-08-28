import 'package:dio/dio.dart';
import 'api_client.dart';
import '../storage/token_storage.dart';

class AuthApi {
  final Dio _dio = ApiClient().dio;

  /// Calls POST /login with { email, password } and saves returned token to Hive.
  /// Returns the token string on success.
  Future<String> login({required String email, required String password}) async {
    final resp = await _dio.post('/login', data: {'email': email, 'password': password});

    if (resp.statusCode == 200 || resp.statusCode == 201) {
      final data = resp.data;
      if (data == null) throw Exception('Empty response from login');

      // Expecting the backend to return a JSON object that includes a token field
      final token = data['token'] as String?;
      if (token != null && token.isNotEmpty) {
        await TokenStorage.saveToken(token);
        return token;
      } else {
        throw Exception('Token not found in login response');
      }
    }

    throw Exception('Login failed: ${resp.statusCode} - ${resp.statusMessage}');
  }

  Future<void> logout() async {
    await TokenStorage.deleteToken();
  }
}