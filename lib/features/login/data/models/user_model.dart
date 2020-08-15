import 'package:flutter/material.dart';
import 'package:workshop39/features/login/domain/entities/user.dart';

class UserModel {
  final String name;
  final String surname;
  final bool isMale;
  final String email;
  final String phoneNumber;

  UserModel({
    @required this.name,
    @required this.surname,
    @required this.isMale,
    @required this.email,
    @required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      surname: json['surname'],
      isMale: json['is_male'],
      email: json['email'],
      phoneNumber: json['phone'],
    );
  }

  User toEntity() {
    return User(
      name: name,
      surname: surname,
      isMale: isMale,
      email: email,
      phoneNumber: phoneNumber,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'is_male': isMale,
      'email': email,
      'phone': phoneNumber,
    };
  }
}