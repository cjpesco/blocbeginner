part of 'counter_cubit.dart';

enum CounterStatus { initial, increment, decrement }

class CounterState extends Equatable {
  final int counterValue;
  final CounterStatus status;
  CounterState({
    @required this.counterValue,
    @required this.status,
  });

  factory CounterState.initial() {
    return CounterState(
      counterValue: 0,
      status: CounterStatus.initial,
    );
  }

  @override
  List<Object> get props => [counterValue, status];

  CounterState copyWith({
    int counterValue,
    CounterStatus status,
  }) {
    return CounterState(
      counterValue: counterValue ?? this.counterValue,
      status: status ?? this.status,
    );
  }
}
