import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../additional/constant.dart';
import '../../../additional/preferences.dart';
import '../../../api/api_manager.dart';
import '../../../api/endpoint/community_post/comment/delete_comment/community_post_comment_delete_request.dart';
import '../../../api/endpoint/community_post/comment/delete_comment/community_post_comment_delete_request_data.dart';
import '../../../api/endpoint/community_post/comment/home_comment/community_post_comment_home_request_data.dart';
import '../../../api/endpoint/community_post/comment/insert_comment/community_post_comment_insert_request.dart';
import '../../../api/endpoint/community_post/comment/insert_comment/community_post_comment_insert_request_data.dart';
import '../../../api/endpoint/community_post/comment/update_comment/community_post_comment_update_request.dart';
import '../../../api/endpoint/community_post/comment/update_comment/community_post_comment_update_request_data.dart';
import '../../../api/endpoint/community_post/like/community_post_like_request.dart';
import '../../../api/endpoint/community_post/like/community_post_like_request_data.dart';
import '../../../api/endpoint/community_post/post/delete_post/community_post_delete_request.dart';
import '../../../api/endpoint/community_post/post/delete_post/community_post_delete_request_data.dart';
import '../../../api/endpoint/community_post/post/home_post/community_post_home_response.dart';
import '../../../api/endpoint/community_post/post/home_post/community_post_home_response_data.dart';
import '../../../api/endpoint/community_post/post/insert_post/community_post_insert_request.dart';
import '../../../api/endpoint/community_post/post/update_post/community_post_update_request.dart';
import '../../../api/endpoint/community_post/post/update_post/community_post_update_request_data.dart';

part 'community_post_event.dart';
part 'community_post_state.dart';

class CommunityPostBloc extends Bloc<CommunityPostEvent, CommunityPostState> {
  CommunityPostBloc() : super(CommunityPostInitial()) {
    on<CommunityPostEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<onGetAllCommunityPost>(_getAllPost);
    on<onInsertCPost>(_insertPost);
    on<onEditCPost>(_editPost);
    on<onDeleteCPost>(_deletePost);
    on<onGetSpecifictComment>(_getSpecComment);
    on<onInsertComment>(_insertComment);
    on<onUpdateComment>(_editComment);
    on<onDeleteComment>(_deleteComment);
    on<onLikePost>(_likePost);
  }

  FutureOr<void> _getAllPost(onGetAllCommunityPost event, Emitter<CommunityPostState> emit) async {
    try {
      emit(onGetAllCommunityPostLoading());

      Response response = await ApiManager().getDataFeedback(
          Token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? ""
      );

      if (response.statusCode == 200) {
        CommunityPostHomeResponse communityPostHomeResponse = CommunityPostHomeResponse.fromJson(jsonDecode(response.data));


        emit(onGetAllCommunityPostSuccess(data: communityPostHomeResponse.data![0]));

      } else {
        emit(onGetAllCommunityPostFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onGetAllCommunityPostFailed(message: message));
    } finally {
      emit(onGetAllCommunityPostFinished());
    }
  }

  FutureOr<void> _insertPost(onInsertCPost event, Emitter<CommunityPostState> emit) async {
    try {
      emit(onInsertPostLoading());

      CommunityPostInsertRequest communityPostInsertRequest = CommunityPostInsertRequest(
          token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? "",
          postMessage: event.postMessage);

      Response response = await ApiManager().insertDataCommunityPost(
          data: communityPostInsertRequest
      );

      if (response.statusCode == 200) {

        emit(onInsertPostSuccess());

      } else {
        emit(onInsertPostFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onInsertPostFailed(message: message));
    } finally {
      emit(onInsertPostFinished());
    }
  }

  FutureOr<void> _editPost(onEditCPost event, Emitter<CommunityPostState> emit) async {
    try {
      emit(onUpdatePostLoading());

      CommunityPostUpdateRequest communityPostUpdateRequest = CommunityPostUpdateRequest(
          token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? "",
          data: [event.data]
      );

      Response response = await ApiManager().updateDataCommunityPost(
          data: communityPostUpdateRequest
      );

      if (response.statusCode == 200) {

        emit(onUpdatePostSuccess());

      } else {
        emit(onUpdatePostFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onUpdatePostFailed(message: message));
    } finally {
      emit(onUpdatePostFinished());
    }
  }

  FutureOr<void> _deletePost(onDeleteCPost event, Emitter<CommunityPostState> emit) async {
    try {
      emit(onDeletePostLoading());

      CommunityPostDeleteRequest communityPostDeleteRequest = CommunityPostDeleteRequest(
          token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? "",
          data: [event.data]
      );

      Response response = await ApiManager().deleteDataCommunityPost(
          data: communityPostDeleteRequest
      );

      if (response.statusCode == 200) {

        emit(onDeletePostSuccess());

      } else {
        emit(onDeletePostFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onUpdatePostFailed(message: message));
    } finally {
      emit(onUpdatePostFinished());
    }
  }

  FutureOr<void> _getSpecComment(onGetSpecifictComment event, Emitter<CommunityPostState> emit) async {
  }

  FutureOr<void> _insertComment(onInsertComment event, Emitter<CommunityPostState> emit) async {
    try {
      emit(onInsertCommentLoading());

      CommunityPostCommentInsertRequest communityPostCommentInsertRequest = CommunityPostCommentInsertRequest(
          token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? "",
          data: [event.data]
      );

      Response response = await ApiManager().insertDataCommunityPostComment(
          data: communityPostCommentInsertRequest
      );

      if (response.statusCode == 200) {

        emit(onInsertCommentSuccess());

      } else {
        emit(onInsertCommentFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onInsertCommentFailed(message: message));
    } finally {
      emit(onInsertCommentFinished());
    }
  }

  FutureOr<void> _editComment(onUpdateComment event, Emitter<CommunityPostState> emit) async {
    try {
      emit(onUpdateCommentLoading());

      CommunityPostCommentUpdateRequest communityPostCommentUpdateRequest = CommunityPostCommentUpdateRequest(
          token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? "",
          data: [event.data]
      );

      Response response = await ApiManager().updateDataCommunityPostComment(
          data: communityPostCommentUpdateRequest
      );

      if (response.statusCode == 200) {

        emit(onUpdateCommentSuccess());

      } else {
        emit(onUpdateCommentFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onUpdateCommentFailed(message: message));
    } finally {
      emit(onUpdateCommentFinished());
    }
  }

  FutureOr<void> _deleteComment(onDeleteComment event, Emitter<CommunityPostState> emit) async {
    try {
      emit(onDeleteCommentLoading());

      CommunityPostCommentDeleteRequest communityPostCommentDeleteRequest = CommunityPostCommentDeleteRequest(
          token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? "",
          data: [event.data]
      );

      Response response = await ApiManager().deleteDataCommunityPostComment(
          data: communityPostCommentDeleteRequest
      );

      if (response.statusCode == 200) {

        emit(onDeleteCommentSuccess());

      } else {
        emit(onDeleteCommentFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onDeleteCommentFailed(message: message));
    } finally {
      emit(onDeleteCommentFinished());
    }
  }

  FutureOr<void> _likePost(onLikePost event, Emitter<CommunityPostState> emit) async {
    try {
      emit(onLikePostLoading());

      CommunityPostLikeRequest communityPostLikeRequest = CommunityPostLikeRequest(
          token: Preferences.getInstance().getString(SharedPreferenceKey.TOKEN) ?? "",
          data: [event.data]
      );

      Response response = await ApiManager().likeCommunityPost(
          data: communityPostLikeRequest
      );

      if (response.statusCode == 200) {

        emit(onLikePostSuccess());

      } else {
        emit(onLikePostFailed(message: response.data));
      }
    } catch (e) {
      String message = "Something went wrong, try again later!";

      if (e is Exception) {
        message = e.toString().substring(e.toString().indexOf(":") + 1).trim();
      }

      if (e is DioError && e.response != null) {
        message = e.response!.data;
      }

      emit(onLikePostFailed(message: message));
    } finally {
      emit(onLikePostFinished());
    }
  }
}
