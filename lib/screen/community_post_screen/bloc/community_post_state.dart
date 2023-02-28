part of 'community_post_bloc.dart';

@immutable
abstract class CommunityPostState {}

class CommunityPostInitial extends CommunityPostState {}

class onGetAllCommunityPostLoading extends CommunityPostState {}

class onGetAllCommunityPostSuccess extends CommunityPostState {
  CommunityPostHomeResponseData data;

  onGetAllCommunityPostSuccess({required this.data});
}

class onGetAllCommunityPostFailed extends CommunityPostState {
  String message;

  onGetAllCommunityPostFailed({required this.message});
}

class onGetAllCommunityPostFinished extends CommunityPostState {}


class onInsertPostLoading extends CommunityPostState {}

class onInsertPostSuccess extends CommunityPostState {}

class onInsertPostFailed extends CommunityPostState {
  String message;

  onInsertPostFailed({required this.message});
}

class onInsertPostFinished extends CommunityPostState {}


class onUpdatePostLoading extends CommunityPostState {}

class onUpdatePostSuccess extends CommunityPostState {}

class onUpdatePostFailed extends CommunityPostState {
  String message;

  onUpdatePostFailed({required this.message});
}

class onUpdatePostFinished extends CommunityPostState {}


class onDeletePostLoading extends CommunityPostState {}

class onDeletePostSuccess extends CommunityPostState {}

class onDeletePostFailed extends CommunityPostState {
  String message;

  onDeletePostFailed({required this.message});
}

class onDeletePostFinished extends CommunityPostState {}


class onGetSpecifictCommentLoading extends CommunityPostState {}

class onGetSpecifictCommentSuccess extends CommunityPostState {}

class onGetSpecifictCommentFailed extends CommunityPostState {
  String message;

  onGetSpecifictCommentFailed({required this.message});
}

class onGetSpecifictCommentFinished extends CommunityPostState {}


class onInsertCommentLoading extends CommunityPostState {}

class onInsertCommentSuccess extends CommunityPostState {}

class onInsertCommentFailed extends CommunityPostState {
  final String message;

  onInsertCommentFailed({required this.message});
}

class onInsertCommentFinished extends CommunityPostState {}


class onUpdateCommentLoading extends CommunityPostState {}

class onUpdateCommentSuccess extends CommunityPostState {}

class onUpdateCommentFailed extends CommunityPostState {
  final String message;

  onUpdateCommentFailed({required this.message});
}

class onUpdateCommentFinished extends CommunityPostState {}


class onDeleteCommentLoading extends CommunityPostState {}

class onDeleteCommentSuccess extends CommunityPostState {}

class onDeleteCommentFailed extends CommunityPostState {
  final String message;

  onDeleteCommentFailed({required this.message});
}

class onDeleteCommentFinished extends CommunityPostState {}


class onLikePostLoading extends CommunityPostState{}

class onLikePostSuccess extends CommunityPostState{}

class onLikePostFailed extends CommunityPostState{
  final String message;

  onLikePostFailed({required this.message});
}

class onLikePostFinished extends CommunityPostState{}
