// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/models/loginmodel.dart';
import 'package:newsapp/modules/Shopapp/login/logincubit/states.dart';
import 'package:newsapp/shared/endPoints.dart';
import 'package:newsapp/shared/network/remote/diohelper.dart';

class Logincubit extends Cubit<LoginStates> {
  Logincubit() : super(LoginInitailStates());
  static Logincubit get(context) => BlocProvider.of(context);
  LoginModel? shoploginmodel;
  void userlogin({required String email, required String password}) {
    emit(LoginlaodingStates());

    Diohelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      print(value.data);
      shoploginmodel = LoginModel.fromJson(value.data);
      emit(LoginSuccessStates(shoploginmodel));
    }).catchError((onError) {
      emit(LoginErrorStates(onError.toString()));
    });
  }

  IconData suffin = Icons.visibility;
  bool isPassShow = false;

  void changepasswordvisibilty() {
    isPassShow = !isPassShow;

    suffin = isPassShow ? Icons.visibility : Icons.visibility_off;
    emit(VisiblePassword());
  }
}
