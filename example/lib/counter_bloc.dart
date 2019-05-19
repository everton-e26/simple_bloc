import 'package:simple_bloc/simple_bloc.dart';

class CounterBloc extends Bloc {
  final _counterController = BlocController<int>(initalData: 0);

  Stream<int> get counterOut => _counterController.stream;

  Action get increment => _counterController.action((value) {
        return ++value;
      });

  @override
  void dispose() {
    _counterController.dispose();
  }

  @override
  void initialize() {}
}
