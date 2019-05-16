import 'package:simple_bloc/src/bloc.dart';
import 'package:simple_bloc/src/bloc_builder.dart';

class BlocInstanceManager {
  final List<BlocBuilder> blocs;
  final Map<String, Bloc> _blocs = {};

  BlocInstanceManager(this.blocs);

  T of<T extends Bloc>() {
    String type = T.toString();
    T bloc;
    if (_blocs.containsKey(type)) {
      bloc = _blocs[type];
    } else {
      BlocBuilder b = blocs.firstWhere((b) => b.build is T Function());
      bloc = b.build();
      _blocs.putIfAbsent(type, () => bloc);
    }
    return bloc;
  }

  void dispose() {
    _blocs.forEach((key, bloc) {
      bloc.dispose();
    });
  }
}
