class CommunityPostCommentHomeRequestData {
  final int postId;
  final int index;

  CommunityPostCommentHomeRequestData({required this.postId,required this.index});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'post_id': this.postId,
    'index': this.index
  };
}