import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../bloc/registration_form_bloc.dart';

FormBlocStep personalStep(RegistrationFormBloc registrationFormBloc) {
  return FormBlocStep(
    title: Text('Личные данные'),
    content: Column(
      children: <Widget>[
        TextFieldBlocBuilder(
          textFieldBloc: registrationFormBloc.firstName,
          keyboardType: TextInputType.emailAddress,
          enableOnlyWhenFormBlocCanSubmit: true,
          decoration: InputDecoration(
            labelText: 'Имя',
            prefixIcon: Icon(Icons.person),
          ),
        ),
        TextFieldBlocBuilder(
          textFieldBloc: registrationFormBloc.lastName,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Фамилия',
            prefixIcon: Icon(Icons.person),
          ),
        ),
        RadioButtonGroupFieldBlocBuilder<String>(
          selectFieldBloc: registrationFormBloc.gender,
          itemBuilder: (context, value) => value,
          decoration: InputDecoration(
            labelText: 'Пол',
            prefixIcon: SizedBox(),
          ),
        ),
        DateTimeFieldBlocBuilder(
          dateTimeFieldBloc: registrationFormBloc.birthDate,
          firstDate: DateTime(1900),
          initialDate: DateTime.now(),
          lastDate: DateTime.now(),
          format: DateFormat('dd.MM.yyyy'),
          decoration: InputDecoration(
            labelText: 'Дата рождения',
            prefixIcon: Icon(Icons.cake),
          ),
        ),
      ],
    ),
  );
}
