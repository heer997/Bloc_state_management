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
      title: "Bloc Counter App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: BlocProvider(
        create: (state) {
          return CounterBloc();
        },
        child: const CounterApp(),
      ),
    );
  }
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Counter App"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("You have pushed this button many times"),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  state.count.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 50.0),
                );
              },
            ),

            /// Below "selector" is a function which takes the current state
            BlocSelector<CounterBloc, CounterState, bool>(
              selector: (state) {
                /// Below means that if count value is divided by 2 then selector function will return
                /// true otherwise it will return false
                return state.count % 2 == 0;
              },

              /// if count value is divided by 2 then count is Even otherwise it is Odd
              /// selector function executes and checks the count value whether it is Even OR not
              /// if the count is Even then the below Text() widget will be rebuild.
              /// So A part of the UI, inside the BlocSelector is rebuild based on the condition
              /// which we are specified in the "selector" function.
              /// Other parts of the widget Tree outside the BlocSelector that doesn't depend on Even
              /// OR Odd status of Counter will remain Unaffected.
              /// Thus the BlocSelector improves the performance of the Application and that is the
              /// functionality of the BlocSelector.

              builder: (context, isEven) {
                return isEven
                    ? const Text("Even",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.purple))
                    : const Text("Odd",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.brown));
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
