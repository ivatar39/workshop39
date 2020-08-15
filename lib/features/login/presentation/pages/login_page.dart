import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:workshop39/core/navigation/router.gr.dart';
import 'package:workshop39/features/login/presentation/bloc/login_form_bloc.dart';
import 'package:workshop39/features/login/presentation/widgets/loading_dialog.dart';
import 'package:workshop39/injection_container.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginFormBloc>(),
      child: Builder(
        builder: (context) {
          final loginFormBloc = context.bloc<LoginFormBloc>();
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: Text('Вход'),
            ),
            body: FormBlocListener<LoginFormBloc, String, String>(
              onSubmitting: (context, state) {
                LoadingDialog.show(context);
              },
              onSuccess: (context, state) {
                LoadingDialog.hide(context);
                ExtendedNavigator.root
                    .pushAndRemoveUntil(Routes.homePage, (route) => false);
              },
              onFailure: (context, state) {
                LoadingDialog.hide(context);
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(state.failureResponse),
                ));
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFieldBlocBuilder(
                      textFieldBloc: loginFormBloc.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    TextFieldBlocBuilder(
                      textFieldBloc: loginFormBloc.password,
                      suffixButton: SuffixButton.obscureText,
                      decoration: InputDecoration(
                        labelText: 'Пароль',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: CheckboxFieldBlocBuilder(
                        booleanFieldBloc: loginFormBloc.showSuccessResponse,
                        body: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Show success response'),
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: loginFormBloc.submit,
                      child: Text('ВХОД'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
