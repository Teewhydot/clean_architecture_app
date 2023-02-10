part of 'advice_bloc.dart';

@immutable
abstract class AdviceState {}

class AdviceStateInitial extends AdviceState {}

class AdviceStateLoading extends AdviceState {}

class AdviceStateLoaded extends AdviceState {
  final Advice advice;
  AdviceStateLoaded({required this.advice});
}

class AdviceStateError extends AdviceState {
  final String errorMessage;
  AdviceStateError({required this.errorMessage});
}
