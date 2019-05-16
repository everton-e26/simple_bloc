import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:simple_bloc/src/bloc.dart';
import 'package:simple_bloc/src/bloc_builder.dart';
import 'package:simple_bloc/src/bloc_instance_manager.dart';

class BlocProvider extends StatefulWidget {
  final List<BlocBuilder> blocs;
  final Widget child;

  BlocProvider({Key key, this.blocs, this.child}) : super(key: key);

  @override
  _BlocProviderState createState() => _BlocProviderState();

  static T of<T extends Bloc>(BuildContext context) {
    final manager = Provider.of<BlocInstanceManager>(context);
    return manager.of<T>();
  }
}

class _BlocProviderState extends State<BlocProvider> {
  BlocInstanceManager _manager;

  @override
  Widget build(BuildContext context) {
    _manager = BlocInstanceManager(widget.blocs);
    return MultiProvider(
      providers: [Provider<BlocInstanceManager>.value(value: _manager)],
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _manager.dispose();
    super.dispose();
  }
}
