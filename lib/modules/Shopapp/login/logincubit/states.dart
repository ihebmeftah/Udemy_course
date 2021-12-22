import 'package:newsapp/models/loginmodel.dart';

abstract class LoginStates {}

class LoginInitailStates extends LoginStates {}

class LoginlaodingStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {
  LoginModel? shoploginmodel;
  LoginSuccessStates(this.shoploginmodel);
}

class VisiblePassword extends LoginStates {}

class LoginErrorStates extends LoginStates {
  String? error;
  LoginErrorStates(this.error);
}
