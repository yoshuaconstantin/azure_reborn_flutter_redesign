import 'dashboards_home_response_data.dart';

class DashboardsHomeResponse {
  final int status;
  final String message;
  final List<DashboardsHomeResponseData>? data;

  DashboardsHomeResponse({
    required this.status,
    required this.message,
    required this.data
  });

  factory DashboardsHomeResponse.fromJson(Map<String, dynamic> json) {
    List<DashboardsHomeResponseData> Datas = [];

    if (json['data'] != null) {
      json['data'].forEach((v) {
        Datas.add(DashboardsHomeResponseData.fromJson(v));
      });
    }

    return DashboardsHomeResponse(
      status: json['status'],
      message: json['message'],
      data: Datas,
    );
  }
}