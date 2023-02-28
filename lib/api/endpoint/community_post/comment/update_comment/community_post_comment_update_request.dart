import 'community_post_comment_update_request_data.dart';

class CommunityPostCommentUpdateRequest {
  final String token;
  final List<CommunityPostCommentUpdateRequestData> data;

  CommunityPostCommentUpdateRequest({required this.token,required this.data});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'data': this.data,
    'token': this.token
  };
}