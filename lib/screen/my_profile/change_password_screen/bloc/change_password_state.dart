part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}


class onCheckPasswordDoNothing extends ChangePasswordState {}

class onCheckPasswordSuccess extends ChangePasswordState {}

class onCheckPasswordFailed extends ChangePasswordState {
  final String message;

  onCheckPasswordFailed({required this.message});
}

class onChangePasswordLoading extends ChangePasswordState {}

class onChangePasswordSuccess extends ChangePasswordState {}

class onChangePasswordFailed extends ChangePasswordState {
  final String message;

  onChangePasswordFailed({required this.message});
}

class onChangePasswordFinished extends ChangePasswordState {}