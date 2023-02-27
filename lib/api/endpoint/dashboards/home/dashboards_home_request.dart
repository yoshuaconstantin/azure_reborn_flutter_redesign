class DashboardsHomeRequest {
  final String token;


  DashboardsHomeRequest({
    required this.token,
  });

  Map<String, dynamic> toJson() => <String, dynamic> {
    'token': this.token,
  };
}