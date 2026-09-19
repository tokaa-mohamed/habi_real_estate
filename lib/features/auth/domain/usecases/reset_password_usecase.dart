import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository repository;

  const ResetPasswordUseCase(this.repository);

  Future<Either<Failure, Unit>> call({required String email}) async {
    return await repository.resetPassword(email: email);
  }
}
