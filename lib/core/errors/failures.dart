import 'package:equatable/equatable.dart';
import 'package:workshop39/core/constants.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure([this.message]);

  @override
  List<Object> get props => [message];
}

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure() : super(kUserDoesNotExist);
}

class CommonFailure extends Failure {
  const CommonFailure(String message) : super(message);
}
