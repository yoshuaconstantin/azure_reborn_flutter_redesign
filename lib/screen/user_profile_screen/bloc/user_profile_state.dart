part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class onGetDataProfileLoading extends UserProfileState {}

class onGetDataProfileSuccess extends UserProfileState {
  ProfileHomeResponseData data;

  onGetDataProfileSuccess({required this.data});
}

class onGetDataProfileFailed extends UserProfileState {
  final String message;

  onGetDataProfileFailed({required this.message});
}

class onGetDataProfileFinished extends UserProfileState {}


class onInsertDataProfileLoading extends UserProfileState {}

class onInsertDataProfileSuccess extends UserProfileState {}

class onInsertDataProfileFailed extends UserProfileState {
  final String message;

  onInsertDataProfileFailed({required this.message});
}

class onInsertDataProfileFinished extends UserProfileState {}


class onUploadImageProfileLoading extends UserProfileState {}

class onUploadImageProfileSuccess extends UserProfileState {}

class onUploadImageProfileFailed extends UserProfileState {
  final String message;

  onUploadImageProfileFailed({required this.message});
}

class onUploadImageProfileFinished extends UserProfileState {}


class onUpdateImageProfileLoading extends UserProfileState {}

class onUpdateImageProfileSuccess extends UserProfileState {}

class onUpdateImageProfileFailed extends UserProfileState {
  final String message;

  onUpdateImageProfileFailed({required this.message});
}

class onUpdateImageProfileFinished extends UserProfileState {}


class onDeleteImageProfileLoading extends UserProfileState {}

class onDeleteImageProfileSuccess extends UserProfileState {}

class onDeleteImageProfileFailed extends UserProfileState {
  final String message;

  onDeleteImageProfileFailed({required this.message});
}

class onDeleteImageProfileFinished extends UserProfileState {}
