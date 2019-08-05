import 'package:rxdart/rxdart.dart';

typedef void Action();

typedef void Input<T>(T input);

class BlocController<T> {
  final _controller = BehaviorSubject<T>();

  BlocController({T initalData}) {
    if (initalData != null) {
      _controller.add(initalData);
    }
  }

  T get value => _controller.value;

  bool get hasValue => _controller.hasValue;

  Stream<T> get stream => _controller.stream;

  Sink<T> get sink => _controller.sink;

  Action action(T Function(T) handler) => () {
        final newValue = handler(_controller.value);
        _controller.sink.add(newValue);
      };

  Input<T> input(T Function(T, T) handler) => (inputValue) {
        final newValue = handler(inputValue, _controller.value);
        _controller.sink.add(newValue);
      };

  void dispose() {
    _controller.close();
  }
}
