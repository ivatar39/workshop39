import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../bloc/registration_form_bloc.dart';

FormBlocStep socialStep(RegistrationFormBloc registrationFormBloc) {
  return FormBlocStep(
    title: Text('Сети'),
    content: Column(
      children: <Widget>[
        TextFieldBlocBuilder(
          textFieldBloc: registrationFormBloc.vk,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'VK',
          ),
        ),
        TextFieldBlocBuilder(
          textFieldBloc: registrationFormBloc.facebook,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Facebook',
          ),
        ),
        TextFieldBlocBuilder(
          textFieldBloc: registrationFormBloc.phoneNumber,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'Номер телефона',
          ),
        ),
      ],
    ),
  );
}
