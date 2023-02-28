part of 'feedback_user_bloc.dart';

@immutable
abstract class FeedbackUserEvent {}

class onGetDataFeedback extends FeedbackUserEvent {}

class onInsertDataFeedback extends FeedbackUserEvent {
  final String comment;

  onInsertDataFeedback({required this.comment});
}

class onUpdateDataFeedback extends FeedbackUserEvent {
  final int id;
  final String comment;

  onUpdateDataFeedback({required this.id,required this.comment});
}

class onDeleteDataFeedback extends FeedbackUserEvent {
  final int id;

  onDeleteDataFeedback({required this.id});
}