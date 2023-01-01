import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_tuning_event.dart';
part 'profile_tuning_state.dart';

class ProfileTuningBloc extends Bloc<ProfileTuningEvent, ProfileTuningState> {
  ProfileTuningBloc() : super(ProfileTuningInitial()) {
    on<ProfileTuningEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<fillProgressProfile>(_fillProgressDelayed);
  }

  FutureOr<void> _fillProgressDelayed(fillProgressProfile event, Emitter<ProfileTuningState> emit) async {
    emit(fillProgressSucces());
  }
}
