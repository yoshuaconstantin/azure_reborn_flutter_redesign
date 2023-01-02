import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../additional/constant.dart';
import '../../root_file/root_init/request_root.dart';

part 'home_body_event.dart';
part 'home_body_state.dart';

class HomeBodyBloc extends Bloc<HomeBodyEvent, HomeBodyState> {
  HomeBodyBloc() : super(HomeBodyInitial()) {
    on<HomeBodyEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<getInformationWidgetTemp>(_getInformationWidgetTemp);
  }

  FutureOr<void> _getInformationWidgetTemp(getInformationWidgetTemp event, Emitter<HomeBodyState> emit) async {
    try{
      emit(doNoting());

      String CpuTemp0 = await RequestRoot().returnStringRootFucntion(Constant().thermalZoneCpu0);
      String CpuTemp4 = await RequestRoot().returnStringRootFucntion(Constant().thermalZoneCpu4);
      String CpuTemp7 = await RequestRoot().returnStringRootFucntion(Constant().thermalZoneCpu7);

      double cpuTotal = double.parse(CpuTemp0) + double.parse(CpuTemp4) + double.parse(CpuTemp7);
      double cpuAvg = (cpuTotal / 3);


      String GpuTemp = await RequestRoot().returnStringRootFucntion(Constant().thermalZoneGPU);
      String BatTemp = await RequestRoot().returnStringRootFucntion(Constant().thermalZoneBatt);

    emit(getInformationWidgetSucces(
        cpu: cpuAvg,
        gpu: double.parse(GpuTemp),
        batt: double.parse(BatTemp)
    ));


    }catch(e){
      emit(catchError(message: "Temp Checking Error!"));
    }
  }
}
