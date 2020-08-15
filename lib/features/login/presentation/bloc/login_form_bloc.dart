import 'package:auto_route/auto_route.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../core/constants.dart';
import '../../domain/entities/credentials.dart';
import '../../domain/usecases/login.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final Login _login;

  final email = TextFieldBloc(validators: [
    FieldBlocValidators.required,
    FieldBlocValidators.email,
  ]);
  final password = TextFieldBloc(validators: [
    FieldBlocValidators.required,
  ]);

  final showSuccessResponse = BooleanFieldBloc();

  LoginFormBloc({@required Login login})
      : assert(login != null),
        _login = login {
    addFieldBlocs(
      fieldBlocs: [
        email,
        password,
        showSuccessResponse,
      ],
    );
  }
  @override
  void onSubmitting() async {
    final credentials = Credentials(
      email: email.value,
      password: password.value,
    );
    final failureOrSuccess = await _login(LoginParams(credentials));

    await Future.delayed(Duration(seconds: 1));
    failureOrSuccess.fold((failure) {
      emitFailure(failureResponse: failure.message);
    }, (user) {
      emitSuccess(
        successResponse: kSuccess,
      );
    });
  }
}
