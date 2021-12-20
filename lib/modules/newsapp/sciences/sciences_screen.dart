import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/newslayout/news_app/cubit/cubit.dart';
import 'package:newsapp/layout/newslayout/news_app/cubit/states.dart';
import 'package:newsapp/shared/components/components.dart';

class SciencesScreen extends StatelessWidget {
  const SciencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).sciences;
          return builderArticle(list,context);
        });
  }
}
