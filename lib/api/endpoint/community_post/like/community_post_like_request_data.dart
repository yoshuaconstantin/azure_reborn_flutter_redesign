
class CommunityPostLikeRequestData {
  final int postId;
  final String isLike;

  CommunityPostLikeRequestData({required this.postId,required this.isLike});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'post_id': this.postId,
    'is_like': this.isLike,

  };
}