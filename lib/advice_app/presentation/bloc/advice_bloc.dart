import 'package:clean_architecture_app/advice_app/domain/entities/advice_entity.dart';
import 'package:clean_architecture_app/advice_app/domain/failures/map_failure.dart'
    as fail;
import 'package:clean_architecture_app/advice_app/domain/use_cases/advice_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceStateInitial()) {
    final AdviceUsecase adviceUseCase = AdviceUsecase();
    on<AdviceRequested>((event, emit) async {
      emit(AdviceStateLoading());
      // execute business login e.g get an advice
      final failureOrAdvice = await adviceUseCase.getAdvice();
      failureOrAdvice.fold(
          (failure) => emit(AdviceStateError(
              errorMessage: fail.mapFailureToMessage(failure))),
          (advice) => emit(AdviceStateLoaded(advice: advice)));
      // update state back to initial after 5 seconds
      await Future.delayed(const Duration(seconds: 4), () {
        emit(AdviceStateInitial());
      });
    });
  }
}
