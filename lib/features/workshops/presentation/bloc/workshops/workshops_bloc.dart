import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecase.dart';
import '../../../domain/usecases/get_workshops.dart';
import 'bloc.dart';

class WorkshopsBloc extends Bloc<WorkshopsEvent, WorkshopsState> {
  final GetWorkshops _getWorkshops;

  WorkshopsBloc({@required GetWorkshops getWorkshops})
      : assert(getWorkshops != null),
        _getWorkshops = getWorkshops,
        super(const WorkshopsInitial());

  @override
  Stream<WorkshopsState> mapEventToState(WorkshopsEvent event) async* {
    if (event is WorkshopsOpened) {
      yield const WorkshopsLoading();

      final failureOrWorkshops = await _getWorkshops(NoParams());

      yield failureOrWorkshops.fold(
        (failure) => WorkshopsFailed(message: failure.message),
        (workshops) => WorkshopsLoaded(workshops),
      );
    }
  }
}
