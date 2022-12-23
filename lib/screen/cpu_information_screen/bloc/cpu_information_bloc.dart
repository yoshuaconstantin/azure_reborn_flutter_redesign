import 'dart:async';

import 'package:azure_reborn/additional/constant.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/home_body_model/chart_home_model.dart';
import '../../../root_file/root_init/request_root.dart';

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

      String Core0 = await RequestRoot().returnStringRootFucntion(Constant().silverCore0);
      String Core1 = await RequestRoot().returnStringRootFucntion(Constant().silverCore1);
      String Core2 = await RequestRoot().returnStringRootFucntion(Constant().silverCore2);
      String Core3 = await RequestRoot().returnStringRootFucntion(Constant().silverCore3);
      String Core4 = await RequestRoot().returnStringRootFucntion(Constant().goldCore4);
      String Core5 = await RequestRoot().returnStringRootFucntion(Constant().goldCore5);
      String Core6 = await RequestRoot().returnStringRootFucntion(Constant().goldCore6);
      String Core7 = await RequestRoot().returnStringRootFucntion(Constant().primeCore7);

      String GpuMax = await RequestRoot().returnStringRootFucntion(Constant().gpuMaxFreq);
      String GpuMin = await RequestRoot().returnStringRootFucntion(Constant().gpuMinFreq);
      String GpuClock = await RequestRoot().returnStringRootFucntion(Constant().gpuFreq);

      String MemTotal = await RequestRoot().returnStringRootFucntion(Constant().memTotal);
      String memFree = await RequestRoot().returnStringRootFucntion(Constant().memFree);

      double memUsed = 1 - (double.parse(memFree) / double.parse(MemTotal));

      String swapTotal = await RequestRoot().returnStringRootFucntion(Constant().swapTotal);
      String swapAvail = await RequestRoot().returnStringRootFucntion(Constant().swapUsed);

      String GPUThermal = await RequestRoot().returnStringRootFucntion(Constant().thermalZoneGPU);


      double swapUsed = double.parse(swapAvail) / double.parse(swapTotal);


      emit(onGetClockDataSucces(
          core0: double.parse(Core0),
          core1: double.parse(Core1),
          core2: double.parse(Core2),
          core3: double.parse(Core3),
          core4: double.parse(Core4),
          core5: double.parse(Core5),
          core6: double.parse(Core6),
          core7: double.parse(Core7),
          nextInt: event.nextInt + 1,
          gpuMax: double.parse(GpuMax),
          gpuMin: double.parse(GpuMin),
          gpuFreq: double.parse(GpuClock),
          memUsed: memUsed,
          swapTotal: double.parse(swapTotal),
          swapUsed: swapUsed,
          GpuThermal: double.parse(GPUThermal)
      ));



    }catch(e){

    }
  }
}
