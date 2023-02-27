import 'dart:async';

import 'package:azure_reborn/screen/profile_tuning_screen/bloc/profile_tuning_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:root/root.dart';

import '../../../additional/constant.dart';
import '../../../root_file/root_init/request_root.dart';

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
      emit(DoNothing());

      await Root.execChmod755(path: Constant().thermalSettings );

      await Root.execNewRootMethod(cmd: "echo ${event.value.toString()} > ${Constant().thermalSettings}");

      String ThermalCheck  = await RequestRoot().returnStringRootFucntion("cat ${Constant().thermalSettings}");

      if(event.value == int.parse(ThermalCheck)){
        emit(onSetThermalSuccess());
      }else{
        emit(onFailed(message: "Thermal set failed, try again later!"));
      }
      emit(onSetThermalSuccess());
    }catch(e){
      emit(onCatchError(message: "Error set thermal settings"));
    }

  }

  FutureOr<void> _refresh(refreshData event, Emitter<ThermalManagerState> emit) async {
    try{
      String ThermalCheck  = await RequestRoot().returnStringRootFucntion("cat ${Constant().thermalSettings}");

      int index = ThermalManagerConstant().value.indexOf(int.parse(ThermalCheck));

      emit(onRefreshSuccess(index: index));

    }catch(e){
      emit(onCatchError(message: "Error refresh thermal data"));
    }

  }
}
