import 'package:equatable/equatable.dart';

import 'number_trivia_bloc.dart';

abstract class NumberTriviaEvent extends Equatable {
  const NumberTriviaEvent();

  @override
  List<Object> get props => [];
}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  final String numberString;

  GetTriviaForConcreteNumber(this.numberString);
  @override
  List<Object> get props => [numberString];
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {}
class GetTriviaForConcreteNumberCompleted extends NumberTriviaEvent {
  final int number;

  GetTriviaForConcreteNumberCompleted(this.number);

  @override
  List<Object> get props => [number];
}


