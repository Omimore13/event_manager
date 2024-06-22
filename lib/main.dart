import 'package:event_manager/helpers/database_helper.dart';
import 'package:event_manager/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/events_bloc.dart';
import 'bloc/events_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Manager',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => EventsBloc(DatabaseHelper())..add(LoadEvents()),

          )
        ],
        child: HomePage(),
      ),
    );
  }
}
