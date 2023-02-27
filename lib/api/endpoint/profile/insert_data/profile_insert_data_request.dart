
import 'package:azure_reborn/api/endpoint/profile/insert_data/profile_insert_data_request_data.dart';

class ProfileInsertDataRequest {
  final String token;
  final List<ProfileInsertDataRequestData> data;

  ProfileInsertDataRequest({required this.token,required this.data});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'token': this.token,
    'data': this.data,

  };
}