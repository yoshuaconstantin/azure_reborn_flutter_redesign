part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordEvent {}

class onCheckPassword extends ChangePasswordEvent {
  final String password;

  onCheckPassword({required this.password});
}

class onChangePassword extends ChangePasswordEvent {
  final String password;

  onChangePassword({required this.password});
}