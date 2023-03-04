part of 'user_feedback_bloc.dart';

@immutable
abstract class UserFeedbackState {}

class UserFeedbackInitial extends UserFeedbackState {}

class onGetDataFeedbackLoading  extends UserFeedbackState {}

class onGetDataFeedbackSuccess  extends UserFeedbackState {}

class onGetDataFeedbackFailed  extends UserFeedbackState {
  final String message;

  onGetDataFeedbackFailed({required this.message});
}

class onGetDataFeedbackfinished  extends UserFeedbackState {}


class onInsertFeedbackLoading extends UserFeedbackState {}

class onInsertFeedbackSuccess extends UserFeedbackState {}

class onInsertFeedbackFailed extends UserFeedbackState {
  final String message;

  onInsertFeedbackFailed({required this.message});
}

class onInsertFeedbackFinished extends UserFeedbackState {}


class onUpdateFeedbackLoading extends UserFeedbackState {}

class onUpdateFeedbackSuccess extends UserFeedbackState {}

class onUpdateFeedbackFailed extends UserFeedbackState {
  final String message;

  onUpdateFeedbackFailed({required this.message});
}
class onUpdateFeedbackFinished extends UserFeedbackState {}


class onDeleteFeedbackLoading extends UserFeedbackState {}

class onDeleteFeedbackSuccess extends UserFeedbackState {}

class onDeleteFeedbackFailed extends UserFeedbackState {
  final String message;

  onDeleteFeedbackFailed({required this.message});
}

class onDeleteFeedbackFinished extends UserFeedbackState {}