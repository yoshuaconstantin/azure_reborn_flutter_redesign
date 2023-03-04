class DeleteAccountRequest {
  final String token;


  DeleteAccountRequest({required this.token});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'token': this.token,

  };
}