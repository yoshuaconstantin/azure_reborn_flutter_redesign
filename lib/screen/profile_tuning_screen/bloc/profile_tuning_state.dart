part of 'profile_tuning_bloc.dart';

@immutable
abstract class ProfileTuningState {}

class ProfileTuningInitial extends ProfileTuningState {}

class catchError extends ProfileTuningState {}

class fillProgressSucces extends ProfileTuningState{}