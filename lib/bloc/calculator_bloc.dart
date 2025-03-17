import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState(0)) {
    on<AddNumbers>((event, emit) => emit(CalculatorState(event.num1 + event.num2)));
    on<SubtractNumbers>((event, emit) => emit(CalculatorState(event.num1 - event.num2)));
  }
}