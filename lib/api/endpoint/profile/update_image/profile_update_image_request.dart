import 'dart:typed_data';

class ProfileUpdateImageRequest {
  final String token;
  final String oldImgUrl;
  final Uint8List data;

  ProfileUpdateImageRequest({required this.token,required this.oldImgUrl, required this.data});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'token': this.token,
    'oldImgUrl': this.oldImgUrl,
    'data': this.data

  };
}