import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/workshop.dart';

abstract class WorkshopsState extends Equatable {
  const WorkshopsState();

  @override
  List<Object> get props => [];
}

class WorkshopsInitial extends WorkshopsState {
  const WorkshopsInitial();
}

class WorkshopsLoading extends WorkshopsState {
  const WorkshopsLoading();
}

class WorkshopsFailed extends WorkshopsState {
  final String message;

  WorkshopsFailed({@required this.message});
}

class WorkshopsLoaded extends WorkshopsState {
  final List<Workshop> workshops;

  WorkshopsLoaded(this.workshops);

  @override
  List<Object> get props => [workshops];
}
