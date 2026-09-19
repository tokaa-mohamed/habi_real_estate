import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;

  const LogoutUseCase(this.repository);

  Future<Either<Failure, Unit>> call() async {
    return await repository.signOut();
  }
}
