import 'package:flutter/material.dart';
import 'package:simple_bloc/simple_bloc.dart';
import 'counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context)!;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xff177FA9),
              child: Padding(
                padding: const EdgeInsets.all(42.0),
                child: Image.asset('assets/simple_bloc_logo.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "The counter is",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            StreamBuilder(
              stream: bloc.counterOut,
              builder: (_, snapshot) {
                return Text(
                  snapshot.data.toString(),
                  style: Theme.of(context).textTheme.displayMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff177FA9),
        child: Icon(Icons.add),
        onPressed: bloc.increment,
      ),
    );
  }
}
