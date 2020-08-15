import 'package:dartz/dartz.dart';
import 'package:logging/logging.dart';

import '../../../../core/constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/credentials.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_local_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginLocalDataSource localDataSource;
  static final _log = Logger('LoginRepositoryImpl');

  LoginRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, User>> login(Credentials credentials) async {
    try {
      final model = credentials.toModel();
      final userModel = await localDataSource.login(model);
      final user = userModel.toEntity();
      return Right(user);
    } on CacheException catch (e) {
      _log.warning(e);
      return Left(CommonFailure(kSomethingWentWrong));
    } on UserNotFoundException catch (e) {
      _log.warning(e);
      return Left(CommonFailure(kUserDoesNotExist));
    }
  }

  @override
  Future<Either<Failure, void>> registerUser(User user) async {
    try {
      final userModel = user.toModel();
      final register = await localDataSource.register(userModel);
      return Right(register);
    } on CacheException catch (e) {
      _log.warning(e);
      return Left(CommonFailure(kSomethingWentWrong));
    } on UserAlreadyExistsException catch (e) {
      _log.warning(e);
      return Left(CommonFailure(kAlreadyExists));
    }
  }
}
