abstract class LoginStates {}

class LoginInitailStates extends LoginStates {}
class LoginlaodingStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {}

class LoginErrorStates extends LoginStates {
  String? error;
  LoginErrorStates(this.error);
}
