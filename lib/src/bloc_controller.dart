import 'dart:ui';
import 'package:rxdart/rxdart.dart';

class BlocController<T> {
  final _controller = BehaviorSubject<T>();

  BlocController({T initalData}) {
    if (initalData != null) {
      _controller.add(initalData);
    }
  }

  Stream<T> get stream => _controller.stream;

  Sink<T> get sink => _controller.sink;

  VoidCallback action(T Function(T data) handler) {
    return () {
      final newValue = handler(_controller.value);
      _controller.sink.add(newValue);
    };
  }

  Function(T) actionIn(T Function(T inData, T data) handler) {
    return (inData) {
      final newValue = handler(inData, _controller.value);
      _controller.sink.add(newValue);
    };
  }

  void dispose() {
    _controller.close();
  }
}
