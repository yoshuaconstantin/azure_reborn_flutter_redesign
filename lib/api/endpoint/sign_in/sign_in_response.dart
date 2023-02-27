class SignInResponse {
  final int status;
  final String message;
  final String token;
  final String jwt;

  SignInResponse({
    required this.token,
    required this.jwt,
    required this.status,
    required this.message
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
    status: json['status'],
    message: json['message'],
    token: json['token'],
    jwt: json['jwtToken'],
  );
}