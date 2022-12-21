import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cpu_information_event.dart';
part 'cpu_information_state.dart';

class CpuInformationBloc extends Bloc<CpuInformationEvent, CpuInformationState> {
  CpuInformationBloc() : super(CpuInformationInitial()) {
    on<CpuInformationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
