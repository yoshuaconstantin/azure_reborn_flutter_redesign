part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenEvent {}

class onCheckSharedPref extends SplashScreenEvent{}

class onButtonPressed extends SplashScreenEvent {
  int type;

  onButtonPressed({required this.type});
}

class onSplashCheckRoot extends SplashScreenEvent{}
