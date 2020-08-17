import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workshops/bloc.dart';
import '../widgets/workshops_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WorkshopsBloc, WorkshopsState>(
        builder: (context, state) {
          if (state is WorkshopsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WorkshopsFailed) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is WorkshopsLoaded) {
            return WorkshopsWidget(
              workshops: state.workshops,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
