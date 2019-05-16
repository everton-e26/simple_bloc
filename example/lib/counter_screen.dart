import 'package:example/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:simple_bloc/simple_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple BLoC"),
      ),
      body: Center(
        child: StreamBuilder(
          stream: bloc.counterOut,
          builder: (_, snapshot) {
            return Text(snapshot.data.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: bloc.increment,
      ),
    );
  }
}
