import 'package:equatable/equatable.dart';
import 'package:workshop39/features/workshops/domain/entities/workshop.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {
  const FavoritesInitial();
}

class FavoritesLoading extends FavoritesState {
  const FavoritesLoading();
}

class FavoritesFailure extends FavoritesState {
  final String message;

  FavoritesFailure(this.message);

  @override
  List<Object> get props => [message];
}

class FavoritesLoaded extends FavoritesState {
  final List<Workshop> favoriteWorkshops;

  FavoritesLoaded(this.favoriteWorkshops);

  @override
  List<Object> get props => [favoriteWorkshops];
}
