import "package:bloc_state_management/bloc_ripples_code/counter_bloc.dart";
import "package:bloc_state_management/bloc_ripples_code/counter_event.dart";
import "package:bloc_state_management/bloc_ripples_code/counter_state.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bloc Provider",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      /// BlocProvider will dispose this Bloc Instance Automatically Since it is created by
      /// BlocProvider.
      /// Below "create" will be executed only when the bloc instance is looked up
      /// via context.read() method. This means that Whenever we will call this context.read() method
      /// at that time only this CounterBloc() instance will be created.
      /// If we don't call this context.read() then this instance of CounterBloc() will never be
      /// created.
      /// If we apply lazy: true as shown below, then this CounterBloc() instance will be created
      /// immediately.
      home: BlocProvider(
        lazy: true,
        create: (context) {
          return CounterBloc();
        },
        child: const MainScreen2(title: "Flutter Demo Home Page"),
      ),
    );
  }
}
class MainScreen2 extends StatelessWidget
{
  const MainScreen2({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("You have pushed the button this many times"),
            BlocBuilder<CounterBloc, CounterState>(
              /// Whenever the state changes at that time, builder function will Re-executes to
              /// updates the UI
              /// If buildWhen returns True, then only builder function will execute,
              /// If buildWhen returns False, then builder function will not execute and
              /// UI will not get updated
              builder: (context, state) {
                return Text(state.count.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
              buildWhen: (previous, current) {
                print("Previous State : ${previous.count}");
                print("Current State : ${current.count}");
                return true;
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncrementEvent());
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add, color: Colors.white, size: 30.0),
          ),
          const SizedBox(width: 20.0),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecrementEvent());
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.remove, color: Colors.white, size: 30.0),
          ),
        ],
      ),
    );
  }
}