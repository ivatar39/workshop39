import 'package:auto_route/auto_route.dart';

import '../../../../features/login/domain/entities/credentials.dart';

class CredentialsModel {
  final String email;
  final String password;

  CredentialsModel({
    @required this.email,
    @required this.password,
  });

  factory CredentialsModel.fromJson(Map<String, dynamic> json) {
    return CredentialsModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Credentials toEntity() {
    return Credentials(
      email: email,
      password: password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
