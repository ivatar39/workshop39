import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';

import '../../../../features/login/data/models/credentials_model.dart';

class Credentials extends Equatable {
  final String email;
  final String password;

  Credentials({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];

  CredentialsModel toModel() {
    return CredentialsModel(
      email: email,
      password: password,
    );
  }

  @override
  String toString() {
    return 'creds: $email, pass: $password';
  }
}
