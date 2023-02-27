part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class onSignInLoading extends SignInState {}

class onSignInSuccess extends SignInState {
  final SignInResponse data;

  onSignInSuccess({required this.data});
}

class onSignInFailed extends SignInState {
  final String message;

  onSignInFailed({required this.message});
}

class onSignInFinished extends SignInState {}
