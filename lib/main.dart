import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:workshop39/injection_container.dart';
import 'core/constants.dart';
import 'core/navigation/router.gr.dart';

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
  runApp(Workshop39());
}

class Workshop39 extends StatefulWidget {
  @override
  _Workshop39State createState() => _Workshop39State();
}

class _Workshop39State extends State<Workshop39> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop39',
      theme: kTheme,
      builder: ExtendedNavigator<Router>(router: Router()),
    );
  }
}
