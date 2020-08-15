import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:workshop39/features/login/data/models/user_model.dart';

class User extends Equatable {
  final String name;
  final String surname;
  final bool isMale;
  final String email;
  final String phoneNumber;

  User({
    @required this.name,
    @required this.surname,
    @required this.isMale,
    @required this.email,
    @required this.phoneNumber,
  });

  UserModel toModel() {
    return UserModel(
      name: name,
      surname: surname,
      isMale: isMale,
      email: email,
      phoneNumber: phoneNumber,
    );
  }

  @override
  String toString() {
    return 'User: name: $name, surname: $surname, isMale: $isMale, '
        'email: $email, phone: $phoneNumber';
  }

  @override
  List<Object> get props => [name, surname, isMale, email, phoneNumber];
}
