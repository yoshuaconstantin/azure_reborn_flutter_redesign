part of 'profile_screen_bloc.dart';

@immutable
abstract class ProfileScreenState {}

class ProfileScreenInitial extends ProfileScreenState {}

class onGetProfileDataLoading extends ProfileScreenState {}

class onGetProfileDataSuccess extends ProfileScreenState {
  final ProfileHomeResponse data;

  onGetProfileDataSuccess({required this.data});
}

class onGetProfileDataFailed extends ProfileScreenState {
  final String message;

  onGetProfileDataFailed({required this.message});
}

class onGetProfileDataFinished extends ProfileScreenState {}