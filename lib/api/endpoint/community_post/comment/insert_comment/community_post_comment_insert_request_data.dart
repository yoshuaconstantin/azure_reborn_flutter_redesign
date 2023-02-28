class CommunityPostCommentInsertRequestData {
  final int postId;
  final String nickname;
  final String commentBody;


  CommunityPostCommentInsertRequestData({required this.postId,required this.nickname,required this.commentBody});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'post_id': this.postId,
    'nickname': this.nickname,
    'comment_body': this.commentBody

  };
}