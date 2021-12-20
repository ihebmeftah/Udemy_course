// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => BuildBoardingItem(),
                itemCount: 3,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text('indicator'),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {},
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

  Widget BuildBoardingItem() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Icon(
                FontAwesomeIcons.store,
                size: 80,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text('Screen Title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 30,
          ),
          Text('Screen body',
              style: TextStyle(
                fontSize: 14,
              ))
        ],
      );
}
