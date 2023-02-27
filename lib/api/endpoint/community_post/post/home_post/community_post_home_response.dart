
import 'community_post_home_response_data.dart';

class CommunityPostHomeResponse {
  final int status;
  final String message;
  final List<CommunityPostHomeResponseData>? data;

  CommunityPostHomeResponse({
    required this.status,
    required this.message,
    required this.data
  });

  factory CommunityPostHomeResponse.fromJson(Map<String, dynamic> json) {
    List<CommunityPostHomeResponseData> Datas = [];

    if (json['data'] != null) {
      json['data'].forEach((v) {
        Datas.add(CommunityPostHomeResponseData.fromJson(v));
      });
    }

    return CommunityPostHomeResponse(
      status: json['status'],
      message: json['message'],
      data: Datas,
    );
  }
}