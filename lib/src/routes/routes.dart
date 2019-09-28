import 'package:flutter/material.dart';
import 'package:workshop_gdg_cali/src/pages/home/home_page.dart';
import 'package:workshop_gdg_cali/src/pages/maps/maps_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    MapsPage.routeName: (context) => MapsPage(title: 'Personas conectadas'),
    HomePage.routeName: (context) => HomePage(),
  };
}
