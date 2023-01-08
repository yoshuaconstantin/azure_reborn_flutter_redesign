part of 'thermal_manager_bloc.dart';

@immutable
abstract class ThermalManagerEvent {}

class setThermalSettings extends ThermalManagerEvent {
  int value;

  setThermalSettings({required this.value});
}

class refreshData extends ThermalManagerEvent {}