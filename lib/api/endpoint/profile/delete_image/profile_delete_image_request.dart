class ProfileDeleteImageRequest {
  final String token;
  final String oldImgUrl;

  ProfileDeleteImageRequest({required this.token,required this.oldImgUrl});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'token': this.token,
    'oldImgUrl': this.oldImgUrl,

  };
}