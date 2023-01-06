import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'thermal_manager_event.dart';
part 'thermal_manager_state.dart';

class ThermalManagerBloc extends Bloc<ThermalManagerEvent, ThermalManagerState> {
  ThermalManagerBloc() : super(ThermalManagerInitial()) {
    on<ThermalManagerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
