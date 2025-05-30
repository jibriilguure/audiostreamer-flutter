import 'auth_response.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(String email, String password);
}
