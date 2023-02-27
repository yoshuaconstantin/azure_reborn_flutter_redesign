part of 'thermal_manager_bloc.dart';

@immutable
abstract class ThermalManagerState {}

class ThermalManagerInitial extends ThermalManagerState {}

class DoNothing extends ThermalManagerState {}

class onRefreshSuccess extends ThermalManagerState {
  int index;

  onRefreshSuccess({required this.index});
}

class onSetThermalSuccess extends ThermalManagerState {}

class onFailed extends ThermalManagerState {
  String message;

  onFailed({required this.message});
}

class onCatchError extends ThermalManagerState {
  String message;

  onCatchError({required this.message});
}
