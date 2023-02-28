class CommunityPostCommentDeleteRequestData {
  final int postId;
  final int commentId;

  CommunityPostCommentDeleteRequestData({required this.postId,required this.commentId});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'post_id': this.postId,
    'comment_id': this.commentId
  };
}