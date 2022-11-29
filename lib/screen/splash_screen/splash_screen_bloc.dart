import 'dart:async';

import 'package:azure_reborn/additional/constant.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<onCheckSharedPref>(_checkSharedPref);
    on<onButtonPressed>(_chooseTypePressed);
  }

  FutureOr<void> _checkSharedPref(onCheckSharedPref event, Emitter<SplashScreenState> emit) async {
    emit(Loading());
    final prefs = await SharedPreferences.getInstance();

    if(prefs.getString(SharedPreferenceKey.ProcessorKey.name) == null){
      emit(doNothing());
    }else{
      emit(GoToMainHome());
    }
  }

  FutureOr<void> _chooseTypePressed(onButtonPressed event, Emitter<SplashScreenState> emit) async {
    emit(Loading());

    final prefs = await SharedPreferences.getInstance();

    if(event.type == 0){
      await prefs.setString(SharedPreferenceKey.ProcessorKey.name, "SD888");
      emit(GoToMainHome());

    }else if(event.type == 1){
      await prefs.setString(SharedPreferenceKey.ProcessorKey.name, "SD870");
      emit(GoToMainHome());
    }

  }
}
