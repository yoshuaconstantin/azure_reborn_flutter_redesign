part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}

class doNothing extends SplashScreenState {}

class Loading extends SplashScreenState {}

class GoToMainHome extends SplashScreenState {}

class Failed extends SplashScreenState {
  String message;

  Failed({required this.message});
}

class onSplashCheckRootSuccess extends SplashScreenState {
  bool statusRoot;

  onSplashCheckRootSuccess({required this.statusRoot});
}
