import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase.dart';
import '../entities/workshop.dart';
import '../repositories/workshops_repository.dart';

class GetFavoriteWorkshops implements UseCase<List<Workshop>, NoParams> {
  final WorkshopsRepository repository;

  GetFavoriteWorkshops(this.repository);

  @override
  Future<Either<Failure, List<Workshop>>> call(NoParams params) async {
    return await repository.getFavoriteWorkshops();
  }
}
