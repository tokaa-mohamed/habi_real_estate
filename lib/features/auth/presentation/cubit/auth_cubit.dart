import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;
  final LogoutUseCase logoutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.signUpUseCase,
    required this.logoutUseCase,
    required this.getCurrentUserUseCase,
    required this.resetPasswordUseCase,
  }) : super(AuthInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await loginUseCase(email: email, password: password);
    result.fold(
      (failure) => emit(AuthFailureState(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    emit(AuthLoading());
    final result = await signUpUseCase(
      email: email,
      password: password,
      fullName: fullName,
    );
    result.fold(
      (failure) => emit(AuthFailureState(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> checkAuthStatus() async {
    emit(AuthLoading());
    final result = await getCurrentUserUseCase();
    result.fold(
      (failure) => emit(AuthUnauthenticated()),
      (user) {
        if (user != null) {
          emit(AuthAuthenticated(user));
        } else {
          emit(AuthUnauthenticated());
        }
      },
    );
  }

  Future<void> logout() async {
    emit(AuthLoading());
    final result = await logoutUseCase();
    result.fold(
      (failure) => emit(AuthFailureState(failure.message)),
      (_) => emit(AuthUnauthenticated()),
    );
  }

  Future<void> sendPasswordReset({required String email}) async {
    emit(AuthLoading());
    final result = await resetPasswordUseCase(email: email);
    result.fold(
      (failure) => emit(AuthFailureState(failure.message)),
      (_) => emit(const PasswordResetEmailSent('Password reset email sent successfully')),
    );
  }
}
