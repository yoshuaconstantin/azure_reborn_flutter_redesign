
class DashboardsHomeUpdateRequest {
  final String token;
  final String modes;

  DashboardsHomeUpdateRequest({required this.token,required this.modes});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'token': this.token,
    'modes': this.modes,

  };
}