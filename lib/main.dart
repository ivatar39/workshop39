import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import 'core/constants.dart';
import 'core/navigation/router.gr.dart';
import 'core/presentation/bloc/app_bloc.dart';
import 'core/presentation/bloc/app_event.dart';
import 'features/workshops/presentation/bloc/favorites/bloc.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Log all messages
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen(
    (record) {
      // ignore: avoid_print
      print('[${record.level.name}]: ${record.loggerName} ${record.time} --'
          ' ${record.message}');
    },
  );

  await init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AppBloc>(
        create: (_) => sl<AppBloc>()..add(const AppStarted())),
    BlocProvider<FavoritesBloc>(
      create: (_) => sl<FavoritesBloc>()..add(const FavoritesOpened()),
    ),
  ], child: Workshop39()));
}

class Workshop39 extends StatefulWidget {
  @override
  _Workshop39State createState() => _Workshop39State();
}

class _Workshop39State extends State<Workshop39> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workshop39',
      theme: kTheme,
      builder: ExtendedNavigator<Router>(router: Router()),
    );
  }
}
