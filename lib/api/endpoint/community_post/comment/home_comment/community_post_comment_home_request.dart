import 'community_post_comment_home_request_data.dart';

class CommunityPostCommentHomeRequest {
  final String token;
  final List<CommunityPostCommentHomeRequestData> data;

  CommunityPostCommentHomeRequest({required this.token,required this.data});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'data': this.data,
    'token': this.token
  };
}