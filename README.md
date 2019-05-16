# simple_bloc

A simple alternative to the implementation created in Dimension C-137

## Getting started

You should ensure that you add the router as a dependency in your flutter project.

```yaml
dependencies:
  simple_bloc: "^1.0.0"
```

##Usage

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
