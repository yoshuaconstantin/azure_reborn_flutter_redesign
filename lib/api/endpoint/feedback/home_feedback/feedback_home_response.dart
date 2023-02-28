
import 'feedback_home_response_data.dart';

class FeedbackHomeResponse {
  final int status;
  final String message;
  final List<feedbackHomeResponseData>? data;

  FeedbackHomeResponse({
    required this.status,
    required this.message,
    required this.data
  });

  factory FeedbackHomeResponse.fromJson(Map<String, dynamic> json) {
    List<feedbackHomeResponseData> Datas = [];

    if (json['data'] != null) {
      json['data'].forEach((v) {
        Datas.add(feedbackHomeResponseData.fromJson(v));
      });
    }

    return FeedbackHomeResponse(
      status: json['status'],
      message: json['message'],
      data: Datas,
    );
  }
}