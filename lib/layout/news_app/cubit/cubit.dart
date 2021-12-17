// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/news_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/modules/sciences/sciences_screen.dart';
import 'package:newsapp/modules/setting/setting.dart';
import 'package:newsapp/modules/sports/sports_screen.dart';
import 'package:newsapp/shared/network/remote/diohelper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int CurIndex = 0;
  List<Widget> screen = [
    BusinessScreen(),
    SportsScreen(),
    SciencesScreen(),
    SettingScreen()
  ];
  List<BottomNavigationBarItem> bottomNavitem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sport"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Setting",
    )
  ];

  void toggelbottomNavitem(int index) {
    CurIndex = index;
    if (index == 1) getsports();
    if (index == 2) getsciences();

    emit(NewsBottomNavState());
  }

//business part
  List<dynamic> business = [];
  void getbusiness() {
    emit(NewsGetBusinessLoadingState());
    Diohelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'gb',
        'apiKey': '8812bfd53d9547078b1ebeb8f764d55b',
        'category': 'business'
      },
    ).then((value) {
      // print(value.data["articles"][0]['author']);
      business = value.data["articles"];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErorState(error.toString()));
    });
  }

//sports part
  List<dynamic> sports = [];
  void getsports() {
    emit(NewsGetSportsLoadingState());
    if (sports.isEmpty) {
      Diohelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'gb',
          'apiKey': '8812bfd53d9547078b1ebeb8f764d55b',
          'category': 'sports'
        },
      ).then((value) {
        // print(value.data["articles"][0]['author']);
        sports = value.data["articles"];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

//Sciences part
  List<dynamic> sciences = [];
  void getsciences() {
    emit(NewsGetSciencesLoadingState());
    if (sciences.isEmpty) {
      Diohelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'gb',
          'apiKey': '8812bfd53d9547078b1ebeb8f764d55b',
          'category': 'science'
        },
      ).then((value) {
        // print(value.data["articles"][0]['author']);
        sciences = value.data["articles"];
        print(sciences[0]['title']);
        emit(NewsGetSciencesSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSciencesErorState(error.toString()));
      });
    } else {
      emit(NewsGetSciencesSuccessState());
    }
  }

  List<dynamic> search = [];
  void getsearch(String? value) {
    emit(NewsGetsearchLoadingState());

    Diohelper.getData(
      url: 'v2/everything',
      query: {
        'apiKey': '8812bfd53d9547078b1ebeb8f764d55b',
        'q': '$value',
      },
    ).then((value) {
      // print(value.data["articles"][0]['author']);
      search = value.data["articles"];
      print(search[0]['title']);
      emit(NewsGetsearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetsearchErorState(error.toString()));
    });
  }
}
