import 'package:dartz/dartz.dart';
import 'package:logging/logging.dart';
import 'package:workshop39/core/errors/exceptions.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/workshop.dart';
import '../../domain/repositories/workshops_repository.dart';
import '../datasources/workshops_local_data_source.dart';

class WorkshopsRepositoryImpl implements WorkshopsRepository {
  final WorkshopsLocalDataSource localDataSource;
  static final _log = Logger('WorkshopsRepositoryImpl');
  WorkshopsRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Workshop>>> getWorkshops() async {
    try {
      final workshopModels = await localDataSource.getWorkshops();
      final List<Workshop> workshops = [];
      for (final model in workshopModels) {
        final workshop = model.toEntity();
        workshops.add(workshop);
      }
      return Right(workshops);
    } on Exception catch (e) {
      _log.warning(e);
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Workshop>>> getFavoriteWorkshops() async {
    try {
      final data = await localDataSource.getFavoriteWorkshops();

      final List<Workshop> favoriteWorkshops = [];
      for (final model in data) {
        final workshop = model.toEntity();
        favoriteWorkshops.add(workshop);
      }
      return Right(favoriteWorkshops);
    } on CacheException catch (e) {
      _log.warning(e);
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setFavoriteWorkshop(Workshop workshop) async {

        await localDataSource.setFavoriteWorkshop(workshop.toModel());
    return Right({});
  }
}
