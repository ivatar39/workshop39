import 'package:bloc/bloc.dart';

import 'bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationInitial());

  int currentIndex = 1;

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is ToHome) {
      currentIndex = 0;
      yield const NavigationHome();
    }
    if (event is ToFavorites) {
      currentIndex = 1;
      yield const NavigationFavorites();
    }
    if (event is ToProfile) {
      currentIndex = 2;
      yield const NavigationProfile();
    }
  }
}
