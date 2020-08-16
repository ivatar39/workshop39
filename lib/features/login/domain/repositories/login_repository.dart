import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/credentials.dart';
import '../entities/user.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> login(Credentials credentials);

  Future<Either<Failure, void>> registerUser(User user);
}
