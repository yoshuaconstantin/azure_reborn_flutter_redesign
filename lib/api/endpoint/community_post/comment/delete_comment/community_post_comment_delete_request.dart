import 'community_post_comment_delete_request_data.dart';

class CommunityPostCommentDeleteRequest {
  final String token;
  final List<CommunityPostCommentDeleteRequestData> data;

  CommunityPostCommentDeleteRequest({required this.token,required this.data});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'data': this.data,
    'token': this.token
  };
}