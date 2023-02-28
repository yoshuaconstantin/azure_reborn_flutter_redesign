class FeedbackInsertCommentRequest {
  final String token;
  final String comment;

  FeedbackInsertCommentRequest({required this.token,required this.comment});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'token': this.token,
    'comment': this.comment,

  };
}