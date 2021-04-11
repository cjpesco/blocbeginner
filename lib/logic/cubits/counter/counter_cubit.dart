import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocbeginner/contants/constants.dart';
import 'package:blocbeginner/logic/cubits/cubits.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;

  CounterCubit({@required this.internetCubit}) : super(CounterState.initial()) {
    monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription = internetCubit.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        decrement();
      }
    });
  }

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

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
