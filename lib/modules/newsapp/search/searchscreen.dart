// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/newslayout/news_app/cubit/cubit.dart';
import 'package:newsapp/layout/newslayout/news_app/cubit/states.dart';
import 'package:newsapp/shared/components/components.dart';

class Searchscreen extends StatelessWidget {
  Searchscreen({Key? key}) : super(key: key);
  var searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField(
                    change: (value) {
                      NewsCubit.get(context).getsearch(value);
                    },
                    htext: "Search",
                    prefix: Icons.search,
                    controller: searchcontroller,
                    textInputType: TextInputType.text,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "Search must not empty";
                      }
                      return null;
                    }),
              ),
              Expanded(child: buildArticleItem(list, context))
            ],
          ),
        );
      },
    );
  }
}
