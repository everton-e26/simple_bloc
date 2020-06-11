import 'package:simple_bloc/src/bloc.dart';

/// Used to build new bloc
class BlocBuilder<T extends Bloc> {
  final T Function() build;
  BlocBuilder(this.build);
}
