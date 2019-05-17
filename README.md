<img src="https://raw.githubusercontent.com/everton-e26/simple_bloc/master/example/assets/simple_bloc_logo_bg.jpg" width="220">
<br/><br/>
A simple alternative to the implementation of Dimension C-137
<br/><br/>

[![Version](https://img.shields.io/badge/version-1.0.1-blue.svg)](https://pub.dev/packages/simple_bloc)

## Getting started

You should ensure that you add the simple_bloc as a dependency in your flutter project.

```yaml
dependencies:
  simple_bloc: "^1.0.1"
```

read more at [how to install](https://pub.dev/packages/simple_bloc#-installing-tab-)

## Usage

Simple BLoC for counter app

```dart

class CounterBloc extends Bloc {
  final _counterController = BlocController<int>(initalData: 0);

  Stream<int> get counterOut => _counterController.stream;

  VoidCallback get increment => _counterController.action((value) {
        return ++value;
      });

  @override
  void dispose() {
    _counterController.dispose();
  }
}

```

## Full app example

<img src="https://raw.githubusercontent.com/everton-e26/simple_bloc/master/example/assets/app.gif" width="300">

checkout at [github](https://github.com/everton-e26/simple_bloc/tree/master/example)
