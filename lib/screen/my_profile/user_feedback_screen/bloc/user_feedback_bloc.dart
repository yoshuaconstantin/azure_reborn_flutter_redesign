import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_feedback_event.dart';
part 'user_feedback_state.dart';

class UserFeedbackBloc extends Bloc<UserFeedbackEvent, UserFeedbackState> {
  UserFeedbackBloc() : super(UserFeedbackInitial()) {
    on<UserFeedbackEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
