import 'package:auto_route/auto_route.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/credentials.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/register_user.dart';

class RegistrationFormBloc extends FormBloc<String, String> {
  final email = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );

  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.passwordMin6Chars,
    ],
  );

  final firstName = TextFieldBloc();

  final lastName = TextFieldBloc();

  final gender = SelectFieldBloc(
    items: ['Мужчина', 'Женщина'],
  );

  final birthDate = InputFieldBloc<DateTime, Object>(
    validators: [FieldBlocValidators.required],
  );

  final phoneNumber = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final vk = TextFieldBloc();

  final facebook = TextFieldBloc();

  final RegisterUser _registerUser;
  final Login _login;

  RegistrationFormBloc({
    @required RegisterUser registerUser,
    @required Login login,
  })  : assert(registerUser != null),
        _registerUser = registerUser,
        assert(login != null),
        _login = login,
        super() {
    addFieldBlocs(
      fieldBlocs: [
        email,
        password,
      ],
    );
    addFieldBlocs(
      fieldBlocs: [
        firstName,
        lastName,
        gender,
        birthDate,
      ],
      step: 1,
    );
    addFieldBlocs(
      fieldBlocs: [
        phoneNumber,
        vk,
        facebook,
      ],
      step: 2,
    );
  }

  @override
  void onSubmitting() async {
    if (state.currentStep == 0) {
      final credentials = Credentials(
        email: email.value,
        password: password.value,
      );
      final failureOrSuccess = await _login(LoginParams(credentials));

      await Future.delayed(Duration(seconds: 1));

      failureOrSuccess.fold(
        (failure) async {
          if (failure is UserNotFoundFailure) {

            emitSuccess();
          } else {
            emitFailure(failureResponse: failure.message);
          }
        },
        (user) {
          emitFailure(failureResponse: kAlreadyExists);
        },
      );
    } else if (state.currentStep == 1) {
      await Future.delayed(Duration(milliseconds: 500));
      emitSuccess();
    } else if (state.currentStep == 2) {
      final user = User(
        name: firstName.value,
        surname: lastName.value,
        isMale: gender.value.contains('Мужчина'),
        email: email.value,
        phoneNumber: phoneNumber.value,
        birthDate: birthDate.value,
      );
      final failureOrSuccess = await _registerUser(RegisterParams(user: user));
      failureOrSuccess.fold((failure) {
        emitFailure(failureResponse: failure.message);
      }, (success) {
        emitSuccess(successResponse: kSuccess);
      });
    }
  }
}
