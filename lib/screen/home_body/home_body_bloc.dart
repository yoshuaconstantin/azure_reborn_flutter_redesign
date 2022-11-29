import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_body_event.dart';
part 'home_body_state.dart';

class HomeBodyBloc extends Bloc<HomeBodyEvent, HomeBodyState> {
  HomeBodyBloc() : super(HomeBodyInitial()) {
    on<HomeBodyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
