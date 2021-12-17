// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Webview extends StatelessWidget {
  String? url;
  Webview({
    Key? key,
    this.url,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
