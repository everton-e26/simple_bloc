import 'package:flutter/widgets.dart';
import 'package:simple_bloc/simple_bloc.dart';

abstract class Bloc {
  BuildContext _context;
  BuildContext get context => _context;
  void initialize() {}
  void dispose();
}

class BlocInstanceManager {
  final List<BlocBuilder> blocs;
  final Map<String, Bloc> _blocs = {};

  BlocInstanceManager(this.blocs);

  T of<T extends Bloc>(BuildContext context) {
    String type = T.toString();
    T bloc;
    if (_blocs.containsKey(type)) {
      bloc = _blocs[type];
    } else {
      BlocBuilder b = blocs.firstWhere((b) => b.build is T Function());
      bloc = b.build();
      bloc._context = context;
      bloc.initialize();
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
