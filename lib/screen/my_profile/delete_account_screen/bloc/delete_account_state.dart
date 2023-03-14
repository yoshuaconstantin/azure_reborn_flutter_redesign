part of 'delete_account_bloc.dart';

@immutable
abstract class DeleteAccountState {}

class DeleteAccountInitial extends DeleteAccountState {}


class onDeleteAccountLoading extends DeleteAccountState {}

class onDeleteAccountSuccess extends DeleteAccountState {}

class onDeleteAccountFailed extends DeleteAccountState {
  final String message;

  onDeleteAccountFailed({required this.message});
}
class onDeleteAccountFinished extends DeleteAccountState {}



class onVerifyPasswordDoNothing extends DeleteAccountState {}

class onVerifyPasswordSuccess extends DeleteAccountState {}

class onVerifyPasswordFailed extends DeleteAccountState {
  final String message;

  onVerifyPasswordFailed({required this.message});
}

