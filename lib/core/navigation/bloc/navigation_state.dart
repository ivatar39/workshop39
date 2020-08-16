import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {
  const NavigationInitial();
}

class NavigationHome extends NavigationState {
  const NavigationHome();
}

class NavigationFavorites extends NavigationState {
  const NavigationFavorites();
}

class NavigationProfile extends NavigationState {
  const NavigationProfile();
}
