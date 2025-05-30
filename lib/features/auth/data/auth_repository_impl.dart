import '../domain/models/auth_repository.dart';
import 'remote/auth_service.dart';
import '../domain/models/auth_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<AuthResponse> login(String email, String password) {
    return _authService.login(email, password);
  }
}
