import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../core/navigation/router.gr.dart';
import '../../../../injection_container.dart';
import '../bloc/login_form_bloc.dart';
import '../widgets/loading_dialog.dart';

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
            backgroundColor: Colors.lightBlueAccent,
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
                ExtendedNavigator.root.pushAndRemoveUntil(
                    Routes.navigationPage, (route) => false);
              },
              onFailure: (context, state) {
                LoadingDialog.hide(context);
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(state.failureResponse),
                ));
              },
              child: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SingleChildScrollView(
                      child: AspectRatio(
                        aspectRatio: 0.85,
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
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
                                    Container(
                                      width: double.infinity,
                                      child: RaisedButton(
                                        color: Theme.of(context).accentColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        onPressed: loginFormBloc.submit,
                                        child: Text(
                                          'ВХОД',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 18.0),
                                  child: Column(
                                    children: [
                                      Divider(),
                                      Text(
                                        'Нет аккаунта?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      InkWell(
                                        child: Text(
                                          'Зарегестрироваться',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                        onTap: () {
                                          ExtendedNavigator.root
                                              .push(Routes.registrationPage);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
