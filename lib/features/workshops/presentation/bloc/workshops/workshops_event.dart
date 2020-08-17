import 'package:equatable/equatable.dart';

abstract class WorkshopsEvent extends Equatable {
  const WorkshopsEvent();

  @override
  List<Object> get props => [];
}

class WorkshopsOpened extends WorkshopsEvent {
  const WorkshopsOpened();
}
