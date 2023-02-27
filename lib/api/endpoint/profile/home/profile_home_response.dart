import 'package:azure_reborn/api/endpoint/profile/home/profile_home_response_data.dart';

class ProfileHomeResponse {
  final int status;
  final String message;
  final List<ProfileHomeResponseData>? data;

  ProfileHomeResponse({
    required this.status,
    required this.message,
    required this.data
  });

  factory ProfileHomeResponse.fromJson(Map<String, dynamic> json) {
    List<ProfileHomeResponseData> Datas = [];

    if (json['data'] != null) {
      json['data'].forEach((v) {
        Datas.add(ProfileHomeResponseData.fromJson(v));
      });
    }

    return ProfileHomeResponse(
      status: json['status'],
      message: json['message'],
      data: Datas,
    );
  }
}