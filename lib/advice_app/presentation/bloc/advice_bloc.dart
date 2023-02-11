import 'package:clean_architecture_app/advice_app/data/model/advice_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceStateInitial()) {
    on<AdviceRequested>((event, emit) async {
      emit(AdviceStateLoading());
      debugPrint('AdviceRequested');
      // execute business login eg get an advice
      // for now fake the business logic with future.delayed
      await Future.delayed(const Duration(seconds: 3), () {
        emit(AdviceStateLoaded(
            advice: Advice(advice: 'Fake Advice for testing purposes')));
      });
      // update state back to initial after 5 seconds
      await Future.delayed(const Duration(seconds: 5), () {
        emit(AdviceStateInitial());
      });
    });
  }
}
