import 'package:dartz/dartz.dart';
import 'package:workshop39/core/errors/failures.dart';
import 'package:workshop39/features/login/domain/entities/credentials.dart';
import 'package:workshop39/features/login/domain/entities/user.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> login(Credentials credentials);

  Future<Either<Failure, void>> registerUser(User user);
}
