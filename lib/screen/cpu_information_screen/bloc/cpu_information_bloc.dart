import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/home_body_model/chart_home_model.dart';

part 'cpu_information_event.dart';
part 'cpu_information_state.dart';

class CpuInformationBloc extends Bloc<CpuInformationEvent, CpuInformationState> {
  CpuInformationBloc() : super(CpuInformationInitial()) {
    on<CpuInformationEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<onGetClockData>(_getClockData);
  }

  FutureOr<void> _getClockData(onGetClockData event, Emitter<CpuInformationState> emit) async {
    try{
      emit(doNothing());



    }catch(e){

    }
  }
}
