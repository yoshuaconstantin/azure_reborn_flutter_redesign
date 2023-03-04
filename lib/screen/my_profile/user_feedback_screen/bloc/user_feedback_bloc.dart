import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../api/endpoint/feedback/delete_feedback/feedback_delete_comment_request.dart';
import '../../../../api/endpoint/feedback/insert_feedback/feedback_insert_comment_request.dart';
import '../../../../api/endpoint/feedback/update_feedback/feedback_update_comment_request.dart';

part 'user_feedback_event.dart';
part 'user_feedback_state.dart';

class UserFeedbackBloc extends Bloc<UserFeedbackEvent, UserFeedbackState> {
  UserFeedbackBloc() : super(UserFeedbackInitial()) {
    on<UserFeedbackEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<onGetDataFeedback>(_getData);
    on<onInsertFeedback>(_insertData);
    on<onUpdateFeedback>(_updateData);
    on<onDeleteFeedback>(_deleteData);
  }


  FutureOr<void> _getData(onGetDataFeedback event, Emitter<UserFeedbackState> emit) async {
  }

  FutureOr<void> _insertData(onInsertFeedback event, Emitter<UserFeedbackState> emit) async {
  }

  FutureOr<void> _updateData(onUpdateFeedback event, Emitter<UserFeedbackState> emit) async {
  }

  FutureOr<void> _deleteData(onDeleteFeedback event, Emitter<UserFeedbackState> emit) async {
  }
}
