part of 'user_feedback_bloc.dart';

@immutable
abstract class UserFeedbackEvent {}

class onGetDataFeedback extends UserFeedbackEvent {}

class onInsertFeedback extends UserFeedbackEvent {
  final FeedbackInsertCommentRequest data;

  onInsertFeedback({required this.data});
}

class onUpdateFeedback extends UserFeedbackEvent {
  final FeedbackUpdateCommentRequest data;

  onUpdateFeedback({required this.data});
}

class onDeleteFeedback extends UserFeedbackEvent {
  final FeedbackDeleteCommentRequest data;

  onDeleteFeedback({required this.data});
}