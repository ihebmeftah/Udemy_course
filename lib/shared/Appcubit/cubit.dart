import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/Appcubit/states.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<Appstates> {
  AppCubit() : super(AppIntialState());
  static AppCubit get(context) => BlocProvider.of(context);

  ThemeMode appmode = ThemeMode.dark;
  bool isDark = false;
  void changeTheme({bool? fromshared}) {
    if (fromshared != null) {
      isDark = fromshared;
    } else {
      isDark = !isDark;
      CacheHelper.setData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeThemeState());
      });
    }
  }
}
