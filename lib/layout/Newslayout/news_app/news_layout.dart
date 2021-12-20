// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/newslayout/news_app/cubit/states.dart';
import 'package:newsapp/modules/newsapp/search/searchscreen.dart';
import 'package:newsapp/shared/Appcubit/cubit.dart';
import 'package:newsapp/shared/components/components.dart';

import 'cubit/cubit.dart';
// ignore_for_file: prefer_const_constructors

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text("News App"),
                actions: [
                  IconButton(
                      onPressed: () {
                        navigate(context, Searchscreen());
                      },
                      icon: Icon(
                        Icons.search,
                        size: 30,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        AppCubit.get(context).changeTheme();
                      },
                      icon: Icon(
                        Icons.dark_mode_outlined,
                        size: 30,
                      )),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  cubit.toggelbottomNavitem(index);
                },
                currentIndex: cubit.CurIndex,
                items: cubit.bottomNavitem,
              ),
              body: cubit.screen[cubit.CurIndex],
            );
          },
        );
  }
}
