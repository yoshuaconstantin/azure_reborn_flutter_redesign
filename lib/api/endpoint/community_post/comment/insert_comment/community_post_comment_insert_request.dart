import 'community_post_comment_insert_request_data.dart';

class CommunityPostCommentInsertRequest {
  final String token;
  final List<CommunityPostCommentInsertRequestData> data;

  CommunityPostCommentInsertRequest({required this.token,required this.data});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'data': this.data,
    'token': this.token
  };
}