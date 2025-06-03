import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/models/auth_response.dart';

class AuthService {
  final String baseUrl = 'http://172.20.10.3:8080/api/v1/auth';

  Future<AuthResponse> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'), // ✅ correct endpoint
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      if (response.body.isEmpty) {
        throw Exception("Empty response from server");
      }
      return AuthResponse.fromJson(jsonDecode(response.body));
    } else {
      try {
        final body = jsonDecode(response.body);
        throw Exception(body['message'] ?? 'Login failed');
      } catch (_) {
        throw Exception('Login failed with status: ${response.statusCode}');
      }
    }
  }
}
