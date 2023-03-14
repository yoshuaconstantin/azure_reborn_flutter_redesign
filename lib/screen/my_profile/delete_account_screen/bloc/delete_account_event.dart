part of 'delete_account_bloc.dart';

@immutable
abstract class DeleteAccountEvent {}

class onDeleteAccount extends DeleteAccountEvent {
  final DeleteAccountRequest data;

  onDeleteAccount({required this.data});
}

class onVerifyPassword extends DeleteAccountEvent {
  final String password;

  onVerifyPassword({required this.password});
}