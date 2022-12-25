part of 'cpu_information_bloc.dart';

@immutable
abstract class CpuInformationState {}

class CpuInformationInitial extends CpuInformationState {}

class doNothing extends CpuInformationState {}

class Failed extends CpuInformationState {
  String message;

  Failed({required this.message});
}

class onGetClockDataSucces extends CpuInformationState {
  double core0;
  double core1;
  double core2;
  double core3;
  double core4;
  double core5;
  double core6;
  double core7;
  int nextInt;
  double gpuMax;
  double gpuMin;
  double gpuFreq;
  double swapUsed;
  double swapTotal;
  double GpuThermal;
  String swapType;
  int swappiness;

  double memUsed ;
  double memTotal;

  onGetClockDataSucces(
      {required this.core0,
      required this.core1,
      required this.core2,
      required this.core3,
      required this.core4,
      required this.core5,
      required this.core6,
      required this.core7,
      required this.nextInt,
      required this.gpuMax,
      required this.gpuMin,
      required this.gpuFreq,
      required this.memUsed,
      required this.memTotal,
      required this.swapTotal,
      required this.swapUsed,
      required this.GpuThermal,
      required this.swappiness,
      required this.swapType,


      });
}
