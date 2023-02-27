
import 'community_post_like_request_data.dart';

class CommunityPostLikeRequest {
  final String token;
  final List<CommunityPostLikeRequestData> data;

  CommunityPostLikeRequest({required this.token,required this.data});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'token': this.token,
    'data': this.data,

  };
}