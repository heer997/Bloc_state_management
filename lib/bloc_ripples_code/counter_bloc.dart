import "package:bloc_state_management/bloc_ripples_code/counter_event.dart";
import "package:bloc_state_management/bloc_ripples_code/counter_state.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class CounterBloc extends Bloc<CounterEvent, CounterState>
{
  CounterBloc() : super(CounterState(count: 0)) {
    on<CounterIncrementEvent>((event, emit) {
      return emit(CounterState(count: state.count + 1));
    },);

    on<CounterDecrementEvent>((event, emit) {
      return emit(CounterState(count: state.count - 1));
    },);
  }
}