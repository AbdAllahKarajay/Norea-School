import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../data/models/student.dart';
import 'login_event.dart';
import 'login_state.dart';

export 'login_event.dart';
export 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()){
  on<LoginRequestedEvent>((event, emit) {
      emit(LoginLoadingState());
      try {
        final user = Student("اسم تجريبي ${event.code}", 5.4, 50);  //replace with repo or service
        emit(LoginSuccessState(user));
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
  }
}