// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/Shopapp/login/logincubit/states.dart';
import 'package:newsapp/shared/endPoints.dart';
import 'package:newsapp/shared/network/remote/diohelper.dart';

class Logincubit extends Cubit<LoginStates> {
  Logincubit() : super(LoginInitailStates());
  static Logincubit get(context) => BlocProvider.of(context);
  void userlogin({required String email, required String password}) {
    emit(LoginlaodingStates());

    Diohelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      print(value.data);
      emit(LoginSuccessStates());
    }).catchError((onError) {
      emit(LoginErrorStates(onError.toString()));
    });
  }
}
