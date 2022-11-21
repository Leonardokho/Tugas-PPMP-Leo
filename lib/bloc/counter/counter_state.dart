import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counterValue;
  const CounterState({required this.counterValue});

  @override
  List<Object> get props => [counterValue];
}

class CounterInitial extends CounterState {
  CounterInitial() : super(counterValue: 0);
}

class IncrementState extends CounterState {
  IncrementState(int increaseValue) : super(counterValue: increaseValue);
}

class DecrementState extends CounterState {
  DecrementState(int decreaseValue) : super(counterValue: decreaseValue);
}
