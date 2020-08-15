import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase.dart';
import '../entities/credentials.dart';
import '../entities/user.dart';
import '../repositories/login_repository.dart';

class Login implements UseCase<User, LoginParams> {
  final LoginRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.login(params.credentials);
  }
}

class LoginParams extends Equatable {
  final Credentials credentials;

  LoginParams(this.credentials);

  @override
  List<Object> get props => [credentials];
}
