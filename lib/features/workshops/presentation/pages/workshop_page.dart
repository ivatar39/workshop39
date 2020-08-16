import 'package:flutter/material.dart';
import 'package:workshop39/core/constants.dart';
import 'package:workshop39/features/workshops/domain/entities/workshop.dart';

class WorkshopPage extends StatelessWidget {
  final Workshop workshop;

  const WorkshopPage({Key key, this.workshop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor(Set tags) {
      if (tags.length > 1) {
        return kColorsTagMap.values.last;
      } else {
        return kColorsTagMap[tags.first];
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: workshop.name,
        child: Container(
          child: Card(
            color: getColor(workshop.tags),
            child: Text(workshop.name),
          ),
        ),
      ),
    );
  }
}
