import 'package:auto_route/auto_route.dart';

import '../../domain/entities/workshop.dart';

class WorkshopModel {
  final String name;
  final String description;
  final String beginTime;
  final String endTime;
  final List tags;
  final String url;

  WorkshopModel({
    @required this.name,
    @required this.description,
    @required this.beginTime,
    @required this.endTime,
    @required this.tags,
    @required this.url,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'begin_time': beginTime,
      'end_time': endTime,
      'tags': tags.toList(),
      'url': url,
    };
  }

  factory WorkshopModel.fromJson(Map<String, dynamic> json) {
    return WorkshopModel(
      name: json['name'],
      description: json['description'],
      beginTime: json['begin_time'],
      endTime: json['end_time'],
      tags: json['tags'],
      url: json['url'],
    );
  }

  Workshop toEntity() {
    return Workshop(
      name: name,
      description: description,
      beginTime: DateTime.parse(beginTime),
      endTime: DateTime.parse(endTime),
      tags: tags,
      url: url,
    );
  }
}
