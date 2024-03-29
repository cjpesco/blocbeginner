import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void increment() {
    emit(state.copyWith(
      counterValue: state.counterValue + 1,
      status: CounterStatus.increment,
    ));
  }

  void decrement() {
    emit(state.copyWith(
      counterValue: state.counterValue - 1,
      status: CounterStatus.decrement,
    ));
  }
}
