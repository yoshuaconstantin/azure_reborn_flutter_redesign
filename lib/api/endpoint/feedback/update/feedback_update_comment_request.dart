class FeedbackUpdateCommentRequest {
  final int id;
  final String token;
  final String comment;

  FeedbackUpdateCommentRequest({required this.id,required this.token,required this.comment});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'id': this.id,
    'token': this.token,
    'comment': this.comment,
  };
}