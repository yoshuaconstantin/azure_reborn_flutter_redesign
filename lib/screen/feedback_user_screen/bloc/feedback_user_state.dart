part of 'feedback_user_bloc.dart';

@immutable
abstract class FeedbackUserState {}

class FeedbackUserInitial extends FeedbackUserState {}

class onGetDataFeedbackLoading extends FeedbackUserState {}

class onGetDataFeedbackSuccess extends FeedbackUserState {
  final FeedbackHomeResponse data;

  onGetDataFeedbackSuccess({required this.data});
}

class onGetDataFeedbackFailed extends FeedbackUserState {
  final String message;

  onGetDataFeedbackFailed({required this.message});
}

class onGetDataFeedbackFinished extends FeedbackUserState {}

class onInsertDataFeedbackLoading extends FeedbackUserState {}

class onInsertDataFeedbackSuccess extends FeedbackUserState {}

class onInsertDataFeedbackFailed extends FeedbackUserState {
  final String message;

  onInsertDataFeedbackFailed({required this.message});
}

class onInsertDataFeedbackFinished extends FeedbackUserState {}

class onUpdateDataFeedbackLoading extends FeedbackUserState {}

class onUpdateDataFeedbackSuccess extends FeedbackUserState {}

class onUpdateDataFeedbackFailed extends FeedbackUserState {
  final String message;

  onUpdateDataFeedbackFailed({required this.message});
}

class onUpdateDataFeedbackFinished extends FeedbackUserState {}

class onDeleteDataFeedbackLoading extends FeedbackUserState {}

class onDeleteDataFeedbackSuccess extends FeedbackUserState {}

class onDeleteDataFeedbackFailed extends FeedbackUserState {
  final String message;

  onDeleteDataFeedbackFailed({required this.message});
}

class onDeleteDataFeedbackFinished extends FeedbackUserState {}
