abstract class LoginEvent{}

class LoginSuccessEvent extends LoginEvent{}

class LoginRequestedEvent extends LoginEvent{
  final String code;
  LoginRequestedEvent(this.code);
}