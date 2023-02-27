class FeedbackDeleteCommentRequest {
  final int id;
  final String token;


  FeedbackDeleteCommentRequest({required this.id,required this.token});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'id': this.id,
    'token': this.token
  };
}