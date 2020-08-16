import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:workshop39/core/navigation/router.gr.dart';
import 'package:workshop39/features/login/presentation/widgets/loading_dialog.dart';
import 'package:workshop39/features/login/presentation/widgets/regiser_personal_step.dart';
import 'package:workshop39/features/login/presentation/widgets/register_credentials_step.dart';
import 'package:workshop39/features/login/presentation/widgets/register_social_step.dart';

import '../../../../injection_container.dart';
import '../bloc/registration_form_bloc.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegistrationFormBloc(
        registerUser: sl(),
        login: sl(),
      ),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<RegistrationFormBloc>(context);
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: Text('Регистрация'),
            ),
            body: SafeArea(
              child: FormBlocListener<RegistrationFormBloc, String, String>(
                onSubmitting: (context, state) {
                  print('submitting');
                  print(state.lastStep);
                  LoadingDialog.show(context);
                },
                onSuccess: (context, state) {
                  LoadingDialog.hide(context);
                  print('success');
                  print(state.stepCompleted);
                  print(state.lastStep);
                  if (state.stepCompleted == state.lastStep) {
                    ExtendedNavigator.root.push(Routes.homePage);
                  }
                },
                onFailure: (context, state) {
                  LoadingDialog.hide(context);
                },
                formBloc: formBloc,
                child: StepperFormBlocBuilder<RegistrationFormBloc>(
                  type: StepperType.horizontal,
                  onStepTapped: (context, state) {
                    print('tap');
                    print(state);
                  },
                  physics: ClampingScrollPhysics(),
                  formBloc: formBloc,
//                  controlsBuilder: (
//                    context,
//                    onStepContinue,
//                    onStepCancel,
//                    step,
//                    formBloc,
//                  ) {
//                    return Row(
//                      children: <Widget>[
//                        RaisedButton(
//                          onPressed: () {
//                            print('tap');
//                            onStepContinue();
//                            if (formBloc.state.isLastStep) {
//                              print('last');
//                              formBloc.submit();
//                            }
//                          },
//                          color: Theme.of(context).accentColor,
//                          child: const Text(
//                            'ДАЛЕЕ',
//                            style: TextStyle(
//                              color: Colors.white,
//                            ),
//                          ),
//                        ),
//                      ],
//                    );
//                  },
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
          );
        },
      ),
    );
  }
}
