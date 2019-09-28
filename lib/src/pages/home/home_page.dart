import 'package:flutter/material.dart';
import 'package:workshop_gdg_cali/src/pages/home/widgets/page_test.dart';
import 'package:workshop_gdg_cali/src/pages/widgets/navigation_drawer.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Friendly UNIAJC"),
        ),
        drawer: NavigationDrawer(),
        body: Center(
          child: Text("Drawer Tutorial", style: TextStyle(fontSize: 35.0)),
        ));
  }
}
