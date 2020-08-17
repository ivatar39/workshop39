import 'package:equatable/equatable.dart';
import 'package:workshop39/features/workshops/domain/entities/workshop.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class FavoritesOpened extends FavoritesEvent {
  const FavoritesOpened();
}

class FavoritesAdded extends FavoritesEvent {
  final Workshop workshop;

  FavoritesAdded(this.workshop);

  @override
  List<Object> get props => [workshop];
}
