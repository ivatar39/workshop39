import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/workshop_model.dart';

class Workshop extends Equatable {
  final String name;
  final String description;
  final DateTime beginTime;
  final DateTime endTime;
  final Set<String> tags;
  final String url;

  Workshop({
    @required this.name,
    @required this.description,
    @required this.beginTime,
    @required this.endTime,
    @required this.tags,
    @required this.url,
  });

  WorkshopModel toModel() {
    return WorkshopModel(
      name: name,
      description: description,
      beginTime: beginTime.toString(),
      endTime: endTime.toString(),
      tags: tags,
      url: url,
    );
  }

  @override
  List<Object> get props => [name, description, beginTime, endTime, tags, url];

  @override
  String toString() {
    return 'Workshop: $name, desc: $description, '
        'begin: $beginTime, end: $endTime, tags: $tags, url: $url';
  }
}
