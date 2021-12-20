// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/models/boardingModel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var boardcontroler = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
        icon: FontAwesomeIcons.store,
        title: 'On board title 1 ',
        body: 'On board body 1 '),
    BoardingModel(
        icon: FontAwesomeIcons.shopify,
        title: 'On board title 2 ',
        body: 'On board body 2 '),
    BoardingModel(
        icon: FontAwesomeIcons.creditCard,
        title: 'On board title 3 ',
        body: 'On board body 3 ')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardcontroler,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    BuildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardcontroler,
                    count: boarding.length,
                    effect: WormEffect()),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    boardcontroler.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn);
                  },
                  child: Icon(
                    FontAwesomeIcons.arrowRight,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget BuildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Icon(
                model.icon,
                size: 200,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(model.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(model.body,
                style: TextStyle(
                  fontSize: 14,
                )),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      );
}
