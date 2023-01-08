import 'dart:async';

import 'package:azure_reborn/screen/profile_tuning_screen/bloc/profile_tuning_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'thermal_manager_event.dart';
part 'thermal_manager_state.dart';

class ThermalManagerBloc extends Bloc<ThermalManagerEvent, ThermalManagerState> {
  ThermalManagerBloc() : super(ThermalManagerInitial()) {
    on<ThermalManagerEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<setThermalSettings>(_setThermal);
    on<refreshData>(_refresh);
  }

  FutureOr<void> _setThermal(setThermalSettings event, Emitter<ThermalManagerState> emit) async {
    try{

    }catch(e){
      emit(onCatchError(message: "Error set thermal settings"));
    }

  }

  FutureOr<void> _refresh(refreshData event, Emitter<ThermalManagerState> emit) async {
    try{

    }catch(e){
      emit(onCatchError(message: "Error refresh thermal data"));
    }

  }
}
