import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class CommonFailure extends Failure {
  final String message;

  CommonFailure(this.message);

  @override
  List<Object> get props => [message];
}
