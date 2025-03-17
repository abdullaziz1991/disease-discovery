part of 'calculator_bloc.dart';

abstract class CalculatorEvent {}
class AddNumbers extends CalculatorEvent {
  final int num1, num2;
  AddNumbers(this.num1, this.num2);
}
class SubtractNumbers extends CalculatorEvent {
  final int num1, num2;
  SubtractNumbers(this.num1, this.num2);
}
