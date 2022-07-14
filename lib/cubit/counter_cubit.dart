import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterCubitState>{
  CounterCubit() : super(CounterCubitState(counterValue: 0));

  void increment() => emit(CounterCubitState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterCubitState(counterValue: state.counterValue - 1, wasIncremented: false));
}