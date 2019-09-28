import 'package:flutter/material.dart';

Color primaryColor = Colors.indigo;
Color secondaryColor = Colors.yellow;
Color gradientStart = primaryColor;
Color gradientEnd = Colors.lightBlue;

LinearGradient primaryGradient = LinearGradient(
  colors: [gradientStart, gradientEnd],
  stops: const [0.0, 1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
