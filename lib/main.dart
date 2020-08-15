import 'package:flutter/material.dart';
import 'package:workshop39/injection_container.dart';
import 'core/constants.dart';

void main() async {
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
      home: Scaffold(),
    );
  }
}
