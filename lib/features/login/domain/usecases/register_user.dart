import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase.dart';
import '../entities/user.dart';
import '../repositories/login_repository.dart';

class RegisterUser implements UseCase<void, RegisterParams> {
  final LoginRepository repository;

  RegisterUser(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterParams params) async {
    return await repository.registerUser(params.user);
  }
}

class RegisterParams extends Equatable {
  final User user;

  RegisterParams({@required this.user});

  @override
  List<Object> get props => [user];
}
