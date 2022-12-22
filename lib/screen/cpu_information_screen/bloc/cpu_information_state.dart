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
  List<ChartDataModel> core0;
  double core1;
  double core2;
  double core3;
  double core4;
  double core5;
  double core6;
  double core7;
  int gpu;

  onGetClockDataSucces(
      {required this.core0,
      required this.core1,
      required this.core2,
      required this.core3,
      required this.core4,
      required this.core5,
      required this.core6,
      required this.core7,
      required this.gpu});
}
