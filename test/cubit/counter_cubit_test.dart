import 'package:bloc_test/bloc_test.dart';
import 'package:blocbeginner/cubits/cubits.dart';
import 'package:test/test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('The initial state for CounterCubit is CounterState.initial()', () {
      expect(counterCubit.state, CounterState.initial());
    });

    blocTest(
      'the cubit should emit a CounterState(counterValue: 1, status: CounterStatus.increment) when cubit.increment is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: [CounterState(counterValue: 1, status: CounterStatus.increment)],
    );
    blocTest(
      'the cubit should emit a CounterState(counterValue: -1, status: CounterStatus.decrement) when cubit.decrement is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: [CounterState(counterValue: -1, status: CounterStatus.decrement)],
    );
  });
}
