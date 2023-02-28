part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileEvent {}

class onGetDataProfile extends UserProfileEvent {}

class onInsertDataProfile extends UserProfileEvent {
  ProfileInsertDataRequestData data;

  onInsertDataProfile({required this.data});
}

class onInsertDataProfileImage extends UserProfileEvent {
  final Uint8List data;

  onInsertDataProfileImage({required this.data});
}

class onUpdateDataProfileImage extends UserProfileEvent {
  final String oldImgUrl;
  final Uint8List data;

  onUpdateDataProfileImage({required this.oldImgUrl,required this.data});
}

class onDeleteDataProfileImage extends UserProfileEvent {
  final String oldImgUrl;

  onDeleteDataProfileImage({required this.oldImgUrl});
}