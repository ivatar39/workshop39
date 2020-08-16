import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';

class User extends Equatable {
  final String name;
  final String surname;
  final bool isMale;
  final String email;
  final String phoneNumber;
  final DateTime birthDate;

  User({
    @required this.name,
    @required this.surname,
    @required this.isMale,
    @required this.email,
    @required this.phoneNumber,
    @required this.birthDate,
  });

  UserModel toModel() {
    return UserModel(
      name: name,
      surname: surname,
      isMale: isMale,
      email: email,
      phoneNumber: phoneNumber,
      birthDate: birthDate.toString(),
    );
  }

  @override
  String toString() {
    return 'User: name: $name, surname: $surname, isMale: $isMale, '
        'email: $email, phone: $phoneNumber, birth: $birthDate';
  }

  @override
  List<Object> get props => [
        name,
        surname,
        isMale,
        email,
        phoneNumber,
        birthDate,
      ];
}
