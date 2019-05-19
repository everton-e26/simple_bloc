<img src="https://raw.githubusercontent.com/everton-e26/simple_bloc/master/example/assets/simple_bloc_logo_bg.jpg" width="220">
<br/><br/>
A simple alternative to the implementation of Dimension C-137
<br/><br/>

[![Version](https://img.shields.io/badge/version-1.1.0-blue.svg)](https://pub.dev/packages/simple_bloc)

## Getting started

You should ensure that you add the simple_bloc as a dependency in your flutter project.

```yaml
dependencies:
  simple_bloc: "^1.1.0"
```

read more at [how to install](https://pub.dev/packages/simple_bloc#-installing-tab-)

## Usage

Simple BLoC for counter app

```dart

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

Screen Widget

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

<img src="https://raw.githubusercontent.com/everton-e26/simple_bloc/master/example/assets/app.gif" width="300">

checkout app source at [github](https://github.com/everton-e26/simple_bloc/tree/master/example)
