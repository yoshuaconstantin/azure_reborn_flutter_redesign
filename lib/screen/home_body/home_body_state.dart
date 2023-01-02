part of 'home_body_bloc.dart';

@immutable
abstract class HomeBodyState {}

class HomeBodyInitial extends HomeBodyState {}

class catchError extends HomeBodyState {
  String message;

  catchError({required this.message});
}

class getInformationWidgetSucces extends HomeBodyState {
  double cpu;
  double gpu;
  double batt;

  getInformationWidgetSucces({required this.cpu,required  this.gpu,required  this.batt});
}

class doNoting extends HomeBodyState {}