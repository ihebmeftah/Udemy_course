// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/newslayout/news_app/cubit/cubit.dart';
import 'package:newsapp/shared/Appcubit/cubit.dart';
import 'package:newsapp/shared/Appcubit/states.dart';
import 'package:newsapp/shared/blocObserver.dart';
import 'package:newsapp/shared/network/local/cache_helper.dart';
import 'package:newsapp/shared/network/remote/diohelper.dart';
import 'package:newsapp/shared/styles/theme.dart';
import 'layout/newslayout/news_app/news_layout.dart';
import 'modules/Shopapp/onboarding/onboardingScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
  await CacheHelper.init();
  Diohelper.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getbusiness()),
        BlocProvider(
          create: (context) => AppCubit(),
        )
      ],
      child: BlocConsumer<AppCubit, Appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const OnboardingScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
