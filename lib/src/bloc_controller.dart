import 'package:rxdart/rxdart.dart';
import 'package:simple_bloc/src/bloc.dart';

/// Action typedef
typedef void Action();

/// Input typedef
typedef void Input<T>(T input);

/// Controller base class
class BlocController<T> {
  final _controller = BehaviorSubject<T>();

  BlocController({T? initalData, Bloc? listenBlocClose}) {
    if (initalData != null) {
      _controller.add(initalData);
    }
    if (listenBlocClose != null) {
      listenBlocClose.onDispose(() {
        dispose();
      });
    }
  }

  T? get value => _controller.valueOrNull;

  bool get hasValue => _controller.hasValue;
  bool get isClosed => _controller.isClosed;
  bool get isPaused => _controller.isPaused;

  Stream<T> get stream => _controller.stream;

  Sink<T> get sink => _controller.sink;

  add(T event) {
    _controller.add(event);
  }

  Action action(T? Function(T?) handler) => () {
        final newValue = handler(_controller.valueOrNull);
        if (newValue != null) {
          _controller.sink.add(newValue);
        }
      };

  Input<T> input(T Function(T?, T?) handler) => (inputValue) {
        final newValue = handler(inputValue, _controller.valueOrNull);
        _controller.sink.add(newValue);
      };

  void dispose() {
    _controller.close();
  }
}
