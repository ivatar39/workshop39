import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../bloc/registration_form_bloc.dart';

FormBlocStep credentialsStep(RegistrationFormBloc registrationFormBloc) {
  return FormBlocStep(
    title: Text('Вход'),
    content: Column(
      children: <Widget>[
        TextFieldBlocBuilder(
          textFieldBloc: registrationFormBloc.email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
          ),
        ),
        TextFieldBlocBuilder(
          textFieldBloc: registrationFormBloc.password,
          keyboardType: TextInputType.emailAddress,
          suffixButton: SuffixButton.obscureText,
          decoration: InputDecoration(
            labelText: 'Пароль',
            prefixIcon: Icon(Icons.lock),
          ),
        ),
      ],
    ),
  );
}
