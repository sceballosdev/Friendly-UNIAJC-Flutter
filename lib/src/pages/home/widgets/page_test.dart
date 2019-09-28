import 'package:flutter/material.dart';

class PageTest extends StatelessWidget {

  final String title;

  PageTest(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title), backgroundColor: Colors.redAccent,),
      body: new Center(
        child: new Text(title),
      ),
    );
  }
}