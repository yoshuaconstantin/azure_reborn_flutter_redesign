
import 'feedback_home_response_data.dart';

class feedbackHomeResponse {
  final int status;
  final String message;
  final List<feedbackHomeResponseData>? data;

  feedbackHomeResponse({
    required this.status,
    required this.message,
    required this.data
  });

  factory feedbackHomeResponse.fromJson(Map<String, dynamic> json) {
    List<feedbackHomeResponseData> Datas = [];

    if (json['data'] != null) {
      json['data'].forEach((v) {
        Datas.add(feedbackHomeResponseData.fromJson(v));
      });
    }

    return feedbackHomeResponse(
      status: json['status'],
      message: json['message'],
      data: Datas,
    );
  }
}