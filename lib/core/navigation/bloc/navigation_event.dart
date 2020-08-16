import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class ToHome extends NavigationEvent {
  const ToHome();
}

class ToFavorites extends NavigationEvent {
  const ToFavorites();
}

class ToProfile extends NavigationEvent {
  const ToProfile();
}
