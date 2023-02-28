class CommunityPostCommentUpdateRequestData {
  final int postId;
  final int commentId;
  final String commentBody;


  CommunityPostCommentUpdateRequestData({required this.postId,required this.commentId,required this.commentBody});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'post_id': this.postId,
    'nickname': this.commentId,
    'comment_body': this.commentBody

  };
}