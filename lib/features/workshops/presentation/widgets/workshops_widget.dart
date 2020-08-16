import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/navigation/router.gr.dart';
import '../../domain/entities/workshop.dart';
import 'workshops_util.dart';

class WorkshopsWidget extends StatefulWidget {
  final List<Workshop> workshops;

  const WorkshopsWidget({Key key, this.workshops}) : super(key: key);

  @override
  _WorkshopsWidgetState createState() => _WorkshopsWidgetState();
}

class _WorkshopsWidgetState extends State<WorkshopsWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        widget.workshops.length,
        (index) {
          final workshop = widget.workshops[index];
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Card(
              color: getColor(workshop.tags),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                onTap: () {
                  ExtendedNavigator.root.push(
                    Routes.workshopPage,
                    arguments: WorkshopPageArguments(workshop: workshop),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AutoSizeText(
                        '${getEmojiPrefix(workshop.tags)}${workshop.name}',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.white,
                            ),
                        maxLines: 3,
                        maxFontSize: 34,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${workshop.beginTime.toLocal().month}.'
                            '${workshop.beginTime.toLocal().day}.'
                            '${workshop.beginTime.toLocal().year}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '${workshop.beginTime.toLocal().hour}:'
                            '${workshop.beginTime.toLocal().minute}',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
