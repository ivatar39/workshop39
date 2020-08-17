import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/favorites/bloc.dart';
import '../widgets/workshops_util.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранное'),
      ),
      body: SafeArea(
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesLoading) {
              return Center(
                child: RefreshProgressIndicator(),
              );
            }
            if (state is FavoritesFailure) {
              return Center(
                child: Text(state.message),
              );
            }

            if (state is FavoritesLoaded) {
              if (state.favoriteWorkshops.length == 0) {
                return Center(
                  child: Text('Избранных мероприятий нет'),
                );
              } else {
                final Map<String, dynamic> mappedFavorites = {};
                for (final item in state.favoriteWorkshops) {
                  mappedFavorites[item.name] = item;
                }
                final List finalList = mappedFavorites.values.toList();
                return ListView.separated(
                  itemCount: finalList.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    return Card(
                      color: getColor(finalList[index].tags),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              '${finalList[index].name}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(color: Colors.white),
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                              '${finalList[index].beginTime.toLocal().hour}:'
                              '${finalList[index].beginTime.toLocal().minute}'
                              ' —'
                              ' ${finalList[index].endTime.toLocal().hour}:'
                              '${finalList[index].endTime.toLocal().minute}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
