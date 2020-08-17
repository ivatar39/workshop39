import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecase.dart';
import '../../../domain/usecases/get_favorite_workshops.dart';
import '../../../domain/usecases/set_favorite_workshop.dart';
import 'bloc.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoriteWorkshops _getFavoriteWorkshops;
  final SetFavoriteWorkshop _setFavoriteWorkshop;

  FavoritesBloc({
    @required GetFavoriteWorkshops getFavoriteWorkshops,
    @required SetFavoriteWorkshop setFavoriteWorkshop,
  })  : assert(getFavoriteWorkshops != null),
        _getFavoriteWorkshops = getFavoriteWorkshops,
        assert(setFavoriteWorkshop != null),
        _setFavoriteWorkshop = setFavoriteWorkshop,
        super(
          const FavoritesInitial(),
        );

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
    if (event is FavoritesOpened) {
      yield const FavoritesLoading();

      final failureOrFavorites = await _getFavoriteWorkshops(NoParams());

      yield failureOrFavorites.fold(
        (failure) => FavoritesFailure(failure.message),
        (favorites) => FavoritesLoaded(favorites),
      );
    }
    if (event is FavoritesAdded) {
      yield const FavoritesLoading();

      final failureOrAdded =
          await _setFavoriteWorkshop(WorkshopParams(event.workshop));

      yield await failureOrAdded.fold(
        (failure) => FavoritesFailure(failure.message),
        (added) async {
          final failureOrFavorites = await _getFavoriteWorkshops(NoParams());
          return failureOrFavorites.fold(
            (failure) => FavoritesFailure(failure.message),
            (favorites) => FavoritesLoaded(favorites),
          );
        },
      );
    }
  }
}
