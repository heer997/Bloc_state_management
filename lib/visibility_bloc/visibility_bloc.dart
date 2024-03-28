import "package:bloc_state_management/visibility_bloc/visibility_event.dart";
import "package:bloc_state_management/visibility_bloc/visibility_state.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class VisibilityBloc extends Bloc<VisibilityEvent, VisibilityState>
{
  VisibilityBloc() : super(VisibilityState(show: true)) {
    on<VisibilityShowEvent>((event, emit) {
      return emit(VisibilityState(show: true));
    },);

    on<VisibilityHideEvent>((event, emit) {
      return emit(VisibilityState(show: false));
    },);
  }
}