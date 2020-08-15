import 'package:bloc/bloc.dart';

import 'bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(AppState initialState) : super(initialState);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppOpened) {}
  }
}
