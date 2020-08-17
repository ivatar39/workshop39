import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase.dart';
import '../entities/workshop.dart';
import '../repositories/workshops_repository.dart';

class SetFavoriteWorkshop implements UseCase<void, WorkshopParams> {
  final WorkshopsRepository repository;

  SetFavoriteWorkshop(this.repository);

  @override
  Future<Either<Failure, void>> call(WorkshopParams params) async {
    return await repository.setFavoriteWorkshop(params.workshop);
  }
}

class WorkshopParams extends Equatable {
  final Workshop workshop;

  WorkshopParams(this.workshop);

  @override
  List<Object> get props => [workshop];
}
