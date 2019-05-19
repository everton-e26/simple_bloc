# example

A Counter app with simple_bloc

## Getting Started

example/counter_bloc.dart

```dart
import 'package:simple_bloc/simple_bloc.dart';

class CounterBloc extends Bloc {
  //define the controller
  final _counterController = BlocController<int>(initalData: 0);

  //output
  Stream<int> get counterOut => _counterController.stream;

  //action
  Action get increment => _counterController.action((value) {
        //implement your business logic here
        return ++value;
      });

  @override
  void dispose() {
    //dispose your controller
    _counterController.dispose();
  }
}
```

example/counter_screen.dart

```dart
import 'package:flutter/material.dart';
import 'package:simple_bloc/simple_bloc.dart';
import 'counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //get bloc form provider
    final bloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple BLoC"),
      ),
      body: Center(
        //consume output
        child: StreamBuilder(
          stream: bloc.counterOut,
          builder: (_, snapshot) {
            return Text(snapshot.data.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //call bloc action
        onPressed: bloc.increment,
      ),
    );
  }
}
```

example/main.dart

```dart

import 'package:flutter/material.dart';
import 'package:simple_bloc/simple_bloc.dart';
import 'counter_bloc.dart';
import 'counter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //wrap with the BlocProvider
    return BlocProvider(
      //add your blocs
      blocs: [BlocBuilder(() => CounterBloc())],
      child: MaterialApp(
        title: 'Simple BLoC Example',
        home: CounterScreen()
      ),
    );
  }
}


```
