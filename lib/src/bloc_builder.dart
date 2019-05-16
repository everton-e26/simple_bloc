import 'package:simple_bloc/src/bloc.dart';

class BlocBuilder<T extends Bloc> {
  final T Function() build;
  BlocBuilder(this.build);
}
