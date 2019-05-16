import 'package:example/counter_bloc.dart';
import 'package:example/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:simple_bloc/simple_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [BlocBuilder(() => CounterBloc())],
      child: MaterialApp(
        title: 'Simple BLoC Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CounterScreen(),
      ),
    );
  }
}
