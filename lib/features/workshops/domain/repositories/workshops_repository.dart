import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/workshop.dart';

abstract class WorkshopsRepository {
  Future<Either<Failure, List<Workshop>>> getWorkshops();
}
