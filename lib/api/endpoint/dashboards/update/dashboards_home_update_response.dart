class DashboardsHomeUpdateResponse {
  final int status;
  final String message;

  DashboardsHomeUpdateResponse({
    required this.status,
    required this.message,

  });

  factory DashboardsHomeUpdateResponse.fromJson(Map<String, dynamic> json) => DashboardsHomeUpdateResponse(
    status: json['status'],
    message: json['message'],
  );
}