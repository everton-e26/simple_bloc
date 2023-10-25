import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';
import 'package:simple_bloc/simple_bloc.dart';

/// Base bloc class
abstract class Bloc {
  BuildContext? _context;
  BuildContext? get context => _context;
  final _onDisposeController = BehaviorSubject<Bloc>();
  void initialize() {}

  void _dispose() {
    _onDisposeController.sink.add(this);
    _onDisposeController.close();
    dispose();
  }

  void dispose() {}

  StreamSubscription onDispose(Function() disposing) {
    return _onDisposeController.stream.listen((data) {
      disposing();
    });
  }
}

class BlocInstanceManager {
  final List<BlocBuilder> blocs;
  final Map<String, Bloc> _blocs = {};

  BlocInstanceManager(this.blocs);

  T? of<T extends Bloc>(BuildContext context) {
    String type = T.toString();
    late T bloc;
    if (_blocs.containsKey(type)) {
      bloc = _blocs[type] as T;
    } else {
      BlocBuilder b = blocs.firstWhere((b) => b.build is T Function());
      bloc = b.build() as T;
      bloc._context = context;
      bloc.initialize();
      _blocs.putIfAbsent(type, () => bloc);
    }
    return bloc;
  }

  void dispose() {
    _blocs.forEach((key, bloc) {
      bloc._dispose();
    });
  }
}
