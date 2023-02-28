class CommunityPostInsertRequest {
  final String token;
  final String postMessage;

  CommunityPostInsertRequest({required this.token,required this.postMessage});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'token': this.token,
    'post_message': this.postMessage,

  };
}