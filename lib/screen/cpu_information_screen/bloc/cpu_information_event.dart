part of 'cpu_information_bloc.dart';

@immutable
abstract class CpuInformationEvent {}

class onGetClockData extends CpuInformationEvent {
  int nextInt;

  onGetClockData({required this.nextInt});
}
class onChangeZramSetting extends CpuInformationEvent {
  ZramSettingModel data;

  onChangeZramSetting({required this.data});
}