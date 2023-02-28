part of 'community_post_bloc.dart';

@immutable
abstract class CommunityPostEvent {}

class onGetAllCommunityPost extends CommunityPostEvent {}

class onInsertCPost extends CommunityPostEvent {
  final String postMessage;

  onInsertCPost({required this.postMessage});
}

class onEditCPost extends CommunityPostEvent {
  CommunityPostUpdateRequestData data;

  onEditCPost({required this.data});
}

class onDeleteCPost extends CommunityPostEvent {
  CommunityPostDeleteRequestData data;

  onDeleteCPost({required this.data});
}

class onGetSpecifictComment extends CommunityPostEvent {
  CommunityPostCommentHomeRequestData data;

  onGetSpecifictComment({required this.data});
}

class onInsertComment extends CommunityPostEvent {
  CommunityPostCommentInsertRequestData data;

  onInsertComment({required this.data});
}

class onUpdateComment extends CommunityPostEvent {
  CommunityPostCommentUpdateRequestData data;

  onUpdateComment({required this.data});
}

class onDeleteComment extends CommunityPostEvent {
  CommunityPostCommentDeleteRequestData data;

  onDeleteComment({required this.data});
}

class onLikePost extends CommunityPostEvent {
  CommunityPostLikeRequestData data;

  onLikePost({required this.data});
}