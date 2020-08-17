import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/profile/presentation/profile_page.dart';
import '../../features/workshops/presentation/bloc/workshops/bloc.dart';
import '../../features/workshops/presentation/pages/favorites_page.dart';
import '../../features/workshops/presentation/pages/home_page.dart';
import '../../injection_container.dart';
import 'bloc/navigation_bloc.dart';
import 'bloc/navigation_event.dart';
import 'bloc/navigation_state.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (_) => sl<NavigationBloc>()..add(const ToHome()),
        ),
        BlocProvider<WorkshopsBloc>(
          create: (_) => sl<WorkshopsBloc>()..add(const WorkshopsOpened()),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            if (state is NavigationHome) {
              return HomePage();
            }
            if (state is NavigationFavorites) {
              return FavoritesPage();
            }
            if (state is NavigationProfile) {
              return ProfilePage();
            } else {
              return Container();
            }
          },
        ),
        bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  title: Text('Главная'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.favorite),
                  title: Text('Избранное'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person),
                  title: Text('Профиль'),
                ),
              ],
              currentIndex:
                  BlocProvider.of<NavigationBloc>(context).currentIndex,
              onTap: (index) => yieldPageByIndex(context, index: index),
              type: BottomNavigationBarType.fixed,
            );
          },
        ),
      ),
    );
  }

  void yieldPageByIndex(BuildContext context, {@required int index}) {
    final bloc = BlocProvider.of<NavigationBloc>(context);
    switch (index) {
      case 0:
        bloc.add(const ToHome());
        break;
      case 1:
        bloc.add(const ToFavorites());
        break;
      case 2:
        bloc.add(const ToProfile());
        break;
    }
  }
}
