import "package:bloc_state_management/bloc_ripples_code/counter_event.dart";
import "package:bloc_state_management/bloc_ripples_code/counter_state.dart";
import "package:bloc_state_management/visibility_bloc/counter_bloc.dart";
import "package:bloc_state_management/visibility_bloc/visibility_bloc.dart";
import "package:bloc_state_management/visibility_bloc/visibility_event.dart";
import "package:bloc_state_management/visibility_bloc/visibility_state.dart";
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
      title: "Bloc Listener",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      /// When we use multiple Blocs at that time always prefer to use MultiBlocProvider()
      /// as shown below. Instead of Nesting the BlocProvider, it is recommended to use
      /// MultiBlocProvider() as shown below.
      home: MultiBlocProvider(
        providers: [
          /// BlocProvider will dispose this Bloc Instance Automatically Since it is created by
          /// BlocProvider.
          /// Below "create" will be executed only when the bloc instance is looked up
          /// via context.read() method. This means that Whenever we will call this context.read() method
          /// at that time only this CounterBloc() instance will be created.
          /// If we don't call this context.read() then this instance of CounterBloc() will never be
          /// created.
          /// If we apply lazy: true as shown below, then this CounterBloc() instance will be created
          /// immediately.
          BlocProvider(
            create: (context) {
              return CounterBloc();
            },
          ),
          BlocProvider(
            create: (create) {
              return VisibilityBloc();
            },
          ),
        ],
        child: const MainScreen4(title: "Flutter Counter App with Visibility Event"),
      ),


      ///We can also use List of Blocs as shown below but it will reduce the code Maintainability
      ///and readability as shown below. Below is the Nested BlocProvider. Instead of Nesting the
      ///BlocProvider, it is recommended to use MultiBlocProvider() as shown above.
      // home: BlocProvider<CounterBloc>(
      //   create: (context) {
      //     return CounterBloc();
      //   },
      //   child: BlocProvider<VisibilityBloc>(
      //     create: (create) {
      //       return VisibilityBloc();
      //     },
      //     child: const MainScreen3(title: "Flutter Counter App with Visibility Event"),
      //   ),
      // ),
    );
  }
}
class MainScreen4 extends StatelessWidget
{
  const MainScreen4({super.key, required this.title});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("You have pushed the button this many times",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            BlocBuilder<CounterBloc, CounterState>(
              /// Whenever the state changes at that time, builder function will Re-executes to
              /// updates the UI
              /// If buildWhen returns True, then only builder function will execute,
              /// If buildWhen returns False, then builder function will not execute and
              /// UI will not get updated.
              builder: (context, state) {
                return Text(state.count.toString(),
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              },
              buildWhen: (previous, current) {
                print("Previous State : ${previous.count}");
                print("Current State : ${current.count}");
                return true;
              },
            ),
            BlocBuilder<VisibilityBloc, VisibilityState>(
              builder: (context, state) {
                return Visibility(
                  visible: state.show,
                  child: Container(
                    color: Colors.purple,
                    width: 200.0,
                    height: 200.0,
                  ),
                );
              },
            ),

            /// If we want to rebuild the UI also then in the child, we need to use the BlocBuilder
            /// because BlocListener never rebuilds the UI as shown below
            BlocListener<CounterBloc, CounterState>(
              /// By default, below "listenWhen" returns true as shown below
              /// If this listenWhen returns true then only below "listener" will be called
              /// If this listenWhen returns false then this "listener" will never be called
              /// as shown below
              listenWhen: (previousState, currentState) {
                return true;
              },
              listener: (context, state) {
                if(state.count == 3)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Counter Value is ${state.count}"),),
                    );
                  }
              },
              child: const Text("Bloc Listener"),
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
          const SizedBox(width: 40.0),
          FloatingActionButton(
            onPressed: () {
              context.read<VisibilityBloc>().add(VisibilityShowEvent());
            },
            backgroundColor: Colors.blue,
            child: const Text("Show",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          const SizedBox(width: 20.0),
          FloatingActionButton(
            onPressed: () {
              context.read<VisibilityBloc>().add(VisibilityHideEvent());
            },
            backgroundColor: Colors.blue,
            child: const Text("Hide",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}