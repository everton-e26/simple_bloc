import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:simple_bloc/src/bloc.dart';
import 'package:simple_bloc/src/bloc_builder.dart';

class BlocProvider extends StatefulWidget {
  final List<BlocBuilder> blocs;
  final Widget child;

  BlocProvider({Key key, this.blocs, this.child}) : super(key: key);

  factory BlocProvider.builder(
      {Key key,
      List<BlocBuilder> blocs,
      Widget Function(BuildContext context) builder}) {
    return BlocProvider(
      key: key,
      blocs: blocs,
      child: Builder(
        builder: builder,
      ),
    );
  }

  @override
  _BlocProviderState createState() => _BlocProviderState();

  static T of<T extends Bloc>(BuildContext context) {
    try {
      final manager = Provider.of<BlocInstanceManager>(context);
      final bloc = manager.of<T>(context);
      return bloc;
    } catch (e) {
      final _BlocProviderState state =
          context.ancestorStateOfType(const TypeMatcher<_BlocProviderState>());
      return BlocProvider.of<T>(state.context);
    }
  }
}

class _BlocProviderState extends State<BlocProvider> {
  BlocInstanceManager _manager;

  @override
  void initState() {
    super.initState();
    _manager = BlocInstanceManager(widget.blocs);
  }

  @override
  Widget build(BuildContext context) {
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
