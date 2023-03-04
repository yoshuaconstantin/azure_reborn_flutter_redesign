class ChangePasswordAccountRequest {
  final String token;
  final String password;

  ChangePasswordAccountRequest({required this.token,required this.password});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'token': this.token,
    'password': this.password,

  };
}