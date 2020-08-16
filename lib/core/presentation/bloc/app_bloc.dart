import 'package:bloc/bloc.dart';

import 'bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppInitial());

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppStarted) {}
  }
}
