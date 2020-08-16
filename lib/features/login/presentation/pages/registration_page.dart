import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../core/navigation/router.gr.dart';
import '../../../../injection_container.dart';
import '../bloc/registration_form_bloc.dart';
import '../widgets/loading_dialog.dart';
import '../widgets/regiser_personal_step.dart';
import '../widgets/register_credentials_step.dart';
import '../widgets/register_social_step.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<RegistrationFormBloc>(),
      child: Builder(
        builder: (context) {
          final formBloc = context.bloc<RegistrationFormBloc>();
          return Scaffold(
            backgroundColor: Colors.lightBlueAccent,
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: Text('Регистрация'),
            ),
            body: SafeArea(
              child: FormBlocListener<RegistrationFormBloc, String, String>(
                onSubmitting: (context, state) {
                  LoadingDialog.show(context);
                },
                onSuccess: (context, state) {
                  LoadingDialog.hide(context);
                  if (state.stepCompleted == state.lastStep) {
                    ExtendedNavigator.root.pushAndRemoveUntil(
                      Routes.navigationPage,
                      (route) => false,
                    );
                  }
                },
                onFailure: (context, state) {
                  LoadingDialog.hide(context);
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(state.failureResponse),
                  ));
                },
                formBloc: formBloc,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StepperFormBlocBuilder<RegistrationFormBloc>(
                        type: StepperType.horizontal,
                        physics: ClampingScrollPhysics(),
                        formBloc: formBloc,
                        controlsBuilder: (context, onStepContinue, onStepCancel,
                            step, formBloc) {
                          return Row(
                            children: [
                              RaisedButton(
                                onPressed: onStepContinue,
                                child: Text(
                                  'ДАЛЕЕ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                color: Theme.of(context).accentColor,
                              )
                            ],
                          );
                        },
                        stepsBuilder: (formBloc) {
                          return [
                            credentialsStep(formBloc),
                            personalStep(formBloc),
                            socialStep(formBloc),
                          ];
                        },
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
