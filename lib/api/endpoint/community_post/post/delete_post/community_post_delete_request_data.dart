class CommunityPostDeleteRequestData {
  final int postId;

  CommunityPostDeleteRequestData({required this.postId});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'post_id': this.postId,
  };
}