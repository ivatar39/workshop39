import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

class UserModel {
  final String name;
  final String surname;
  final bool isMale;
  final String email;
  final String phoneNumber;
  final String birthDate;

  UserModel({
    @required this.name,
    @required this.surname,
    @required this.isMale,
    @required this.email,
    @required this.phoneNumber,
    @required this.birthDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      surname: json['surname'],
      isMale: json['is_male'],
      email: json['email'],
      phoneNumber: json['phone'],
      birthDate: json['birth_date'],
    );
  }

  User toEntity() {
    return User(
      name: name,
      surname: surname,
      isMale: isMale,
      email: email,
      phoneNumber: phoneNumber,
      birthDate: DateTime.parse(birthDate),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'is_male': isMale,
      'email': email,
      'phone': phoneNumber,
      'birth_date': birthDate,
    };
  }
}
