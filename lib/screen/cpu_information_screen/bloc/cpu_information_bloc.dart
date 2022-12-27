import 'dart:async';

import 'package:azure_reborn/additional/constant.dart';
import 'package:azure_reborn/model/information_zram_model/zram_setting_model.dart';
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
    on<onChangeZramSetting>(_setZramSetting);
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

      String swappiness = await RequestRoot().returnStringRootFucntion(Constant().swappiness);
      String swapType = await RequestRoot().returnStringRootFucntion(Constant().swaptype);

      String trimmedSwapType = "";

      if(swapType.contains("[zstd]")){
        trimmedSwapType = "Lstd";
      }else if(swapType.contains("[lz4]")){
        trimmedSwapType = "Lz4" ;
      }else if(swapType.contains("[lzo-rle]")){
        trimmedSwapType = "Lzo-rle" ;
      }else if(swapType.contains("[lzo]")){
        trimmedSwapType = "Lzo";
      }else{
        trimmedSwapType = "UNKNOWN";
      }


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
          GpuThermal: double.parse(GPUThermal),
          swappiness: int.parse(swappiness),
          swapType: trimmedSwapType,
          memTotal: double.parse(MemTotal),
      ));



    }catch(e){

    }
  }

  FutureOr<void> _setZramSetting(onChangeZramSetting event, Emitter<CpuInformationState> emit) async {
    try{
      emit(doNothing());

      //set Algorithm
      await RequestRoot().returnStringRootFucntion("echo ${event.data.algorithm} > /sys/block/zram0/comp_algorithm");
      //set MinFree
      await RequestRoot().returnStringRootFucntion("echo ${event.data.minfree} > ?");
      //set Background Ratio
      await RequestRoot().returnStringRootFucntion("echo ${event.data.backgroundRatio} > ?");
      //set Dirty Ratio
      await RequestRoot().returnStringRootFucntion("echo ${event.data.dirtyRatio} > ?");
      //set Zram Size
      await RequestRoot().returnStringRootFucntion("echo ${event.data.size} > /sys/block/zram0/disksize");
      //set Swappiness
      await RequestRoot().returnStringRootFucntion("echo ${event.data.power} > ?");
      //set Cache Preassure
      await RequestRoot().returnStringRootFucntion("echo ${event.data.cachePower} > ?");

      List<String> checkingValue = [
        "cat ",
        "",
        "",
        "",
        "",
        "",
        "",
      ];
      List<String> name = [];
      for(int i =0;i<=checkingValue.length;i++){
        name[i] = await RequestRoot().returnStringRootFucntion("${checkingValue[i]}");
        if(name[0] != "[${event.data.algorithm}]"){
          emit(Failed(message: "Algorithm set Failed"));
        }else if(name[1] != event.data.minfree){
        emit(Failed(message: "MinFree set Failed"));
        }else if(name[2] != event.data.backgroundRatio){
          emit(Failed(message: "Background Ratio set Failed"));
        }else if(name[3] != event.data.dirtyRatio){
          emit(Failed(message: "Dirty Ratio set Failed"));
        }else if(name[4] != event.data.size){
          emit(Failed(message: "Zram Size set Failed"));
        }else if(name[5] != event.data.power){
          emit(Failed(message: "Swappiness set Failed"));
        }else if(name[6] != event.data.cachePower){
          emit(Failed(message: "Cache Preassure set Failed"));
        }
      }


    }catch(e){

    }
  }
}
