part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}


class onSignIn extends SignInEvent {
  final String username;
  final String password;

  onSignIn({required this.username,required this.password});
}