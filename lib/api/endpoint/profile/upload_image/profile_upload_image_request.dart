import 'dart:typed_data';

class ProfileInsertImageRequest {
  final String token;
  final Uint8List data;

  ProfileInsertImageRequest({required this.token,required this.data});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'token': this.token,
    'data': this.data,

  };
}