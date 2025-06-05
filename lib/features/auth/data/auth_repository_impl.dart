import '../domain/models/auth_repository.dart';
import 'remote/auth_service.dart';
import '../domain/models/auth_response.dart';
import 'remote/token_storage_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  final TokenStorageService _tokenStorage = TokenStorageService();

  AuthRepositoryImpl(this._authService);

  @override
  Future<AuthResponse> login(String email, String password) async {
    final response = await _authService.login(email, password);

    //  Securely save the token
    await _tokenStorage.saveToken(response.token);

    return response;
  }
}
