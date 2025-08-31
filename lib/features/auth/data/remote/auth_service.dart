import 'dart:convert';
import 'package:audio_streamer/core/api_endpoints.dart';
import 'package:http/http.dart' as http;
import '../../domain/models/auth_response.dart';

class AuthService {
  Future<AuthResponse> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiEndpoints.login),
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

  Future<Map<String, dynamic>> register(String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiEndpoints.register),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.body.isEmpty) {
        throw Exception("Empty response from server");
      }
      return jsonDecode(response.body);
    } else {
      try {
        final body = jsonDecode(response.body);
        throw Exception(body['message'] ?? 'Registration failed');
      } catch (_) {
        throw Exception(
            'Registration failed with status: ${response.statusCode}');
      }
    }
  }
}
