// import 'package:belajar_flutter_ppmp/bloc/counter/counter_event.dart';
import 'package:belajar_flutter_ppmp/bloc/counter/counter_state.dart';
import 'package:bloc/bloc.dart';

part 'counter_event.dart';
// part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // CounterBloc() : super(CounterInitial()) {
  //   on<CounterIncrementEvent>((event, emit) {
  //     emit(CounterState(counterValue: state.counterValue + 1));
  //   });
  //   on<CounterDecrementEvent>((event, emit) {
  //     emit(CounterState(counterValue: state.counterValue - 1));
  //   });
  // }

  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(IncrementState(state.counterValue + 1));
    });
    on<CounterDecrementEvent>((event, emit) {
      emit(DecrementState(state.counterValue - 1));
    });
  }
}
