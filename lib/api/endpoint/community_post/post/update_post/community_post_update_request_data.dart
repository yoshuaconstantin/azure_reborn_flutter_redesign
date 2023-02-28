class CommunityPostUpdateRequestData {
  final int postId;
  final String postMessage;

  CommunityPostUpdateRequestData({required this.postId,required this.postMessage});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'post_id': this.postId,
    'post_message': this.postMessage,

  };
}