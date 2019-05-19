import 'package:rxdart/rxdart.dart';

typedef void Function() Action();

typedef void Function(T) Input<T>(T);

class BlocController<T> {
  final _controller = BehaviorSubject<T>();

  BlocController({T initalData}) {
    if (initalData != null) {
      _controller.add(initalData);
    }
  }

  Stream<T> get stream => _controller.stream;

  Sink<T> get sink => _controller.sink;

  Action action(T Function(T data) handler) {
    return () {
      final newValue = handler(_controller.value);
      _controller.sink.add(newValue);
    };
  }

  Input<T> input(T Function(T, T) handler) {
    return (inputValue) {
      final newValue = handler(inputValue, _controller.value);
      _controller.sink.add(newValue);
    };
  }

  void dispose() {
    _controller.close();
  }
}
