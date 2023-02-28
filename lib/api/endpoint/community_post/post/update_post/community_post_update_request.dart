import 'community_post_update_request_data.dart';

class CommunityPostUpdateRequest {
  final String token;
  final List<CommunityPostUpdateRequestData> data;

  CommunityPostUpdateRequest({required this.token,required this.data});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'token': this.token,
    'data': this.data,

  };
}