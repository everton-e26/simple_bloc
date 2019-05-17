import 'package:flutter/material.dart';
import 'package:simple_bloc/simple_bloc.dart';
import 'counter_bloc.dart';
import 'counter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [BlocBuilder(() => CounterBloc())],
      child: MaterialApp(
        title: 'Simple BLoC Example',
        home: CounterScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
