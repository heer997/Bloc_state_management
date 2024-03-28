import "package:bloc_state_management/bloc_ripples_code/counter_bloc.dart";
import "package:bloc_state_management/bloc_ripples_code/counter_event.dart";
import "package:bloc_state_management/bloc_ripples_code/counter_state.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MainScreen",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final counterBloc = CounterBloc();  /// Creating the bloc instance here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MainScreen"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("You have pushed the button this many times"),
            BlocBuilder<CounterBloc, CounterState>(
              bloc: counterBloc,
              /// Whenever the state changes at that time, builder function will Re-executes to
              /// updates the UI
              /// If buildWhen returns True, then only builder function will execute,
              /// If buildWhen returns False, then builder function will not execute and
              /// UI will not get updated
              buildWhen: (previous, current) {
                print("Previous state is : ${previous.count}");
                print("Current state is : ${current.count}");
                return true;
                // return current.count >= 2;
              },
              builder: (context, state) {
                return Text(
                  state.count.toString(),
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncrementEvent());
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add, color: Colors.white, size: 30.0),
          ),
          const SizedBox(width: 20.0),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecrementEvent());
            },
            backgroundColor: Colors.brown,
            child: const Icon(Icons.remove, color: Colors.white, size: 30.0),
          ),
        ],
      ),
    );
  }
}
