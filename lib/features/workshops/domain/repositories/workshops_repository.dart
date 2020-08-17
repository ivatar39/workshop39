import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/workshop.dart';

abstract class WorkshopsRepository {
  Future<Either<Failure, List<Workshop>>> getWorkshops();

  Future<Either<Failure, List<Workshop>>> getFavoriteWorkshops();

  Future<Either<Failure, void>> setFavoriteWorkshop(Workshop workshop);
}
