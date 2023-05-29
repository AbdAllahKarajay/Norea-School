import 'package:equatable/equatable.dart';

import '../../../data/models/student.dart';

abstract class LoginState extends Equatable{}

class InitialLoginState extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState{
  final Student user;
  LoginSuccessState(this.user);

  @override
  List<Object?> get props => [user];
}

class LoginLoadingState extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoginErrorState extends LoginState{
  final String error;
  LoginErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

