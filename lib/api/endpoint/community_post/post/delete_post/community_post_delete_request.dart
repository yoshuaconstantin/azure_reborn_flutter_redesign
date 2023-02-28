import 'community_post_delete_request_data.dart';

class CommunityPostDeleteRequest {
  final String token;
  final List<CommunityPostDeleteRequestData> data;

  CommunityPostDeleteRequest({required this.token,required this.data});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'data': this.data,
    'token': this.token
  };
}