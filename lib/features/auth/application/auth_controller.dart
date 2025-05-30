import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/remote/auth_service.dart';
import '../data/auth_repository_impl.dart';
import '../domain/models/auth_response.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<AuthResponse>>(
  (ref) => AuthController(AuthRepositoryImpl(AuthService())),
);

class AuthController extends StateNotifier<AsyncValue<AuthResponse>> {
  final AuthRepositoryImpl _authRepository;

  AuthController(this._authRepository)
      : super(AsyncValue.data(AuthResponse(
          token: '',
        )));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final response = await _authRepository.login(email, password);
      state = AsyncValue.data(response);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
