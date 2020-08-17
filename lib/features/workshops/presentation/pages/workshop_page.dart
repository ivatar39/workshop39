import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';
import 'package:workshop39/features/workshops/presentation/bloc/favorites/bloc.dart';

import '../../domain/entities/workshop.dart';
import '../widgets/workshops_util.dart';

class WorkshopPage extends StatelessWidget {
  final Workshop workshop;

  const WorkshopPage({Key key, this.workshop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainColor = getColor(workshop.tags);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(workshop.name),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              workshop.description,
              style: Theme.of(context).textTheme.headline6,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(
                '${workshop.beginTime.toLocal().month}.'
                '${workshop.beginTime.toLocal().day}.'
                '${workshop.beginTime.toLocal().year} ',
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.timelapse),
              title: Text(''
                  '${workshop.beginTime.toLocal().hour}:'
                  '${workshop.beginTime.toLocal().minute} —'
                  ' ${workshop.endTime.toLocal().hour}:'
                  '${workshop.endTime.toLocal().minute}'),
            ),
            Divider(),
            Expanded(child: SizedBox()),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  elevation: 8,
                  onPressed: () {},
                  child: Text(
                    'ОТПРАВИТЬ ЗАЯВКУ',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        tooltip: 'В избранное',
        child: Icon(Icons.favorite),
        onPressed: () {
          Toast.show('Добавлено в избранное', context);
          BlocProvider.of<FavoritesBloc>(context).add(FavoritesAdded(workshop));
        },
      ),
    );
  }
}
