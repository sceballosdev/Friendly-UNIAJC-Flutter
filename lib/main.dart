import 'package:flutter/material.dart';
import 'package:workshop_gdg_cali/src/friendlyuniajc_app.dart';
import 'package:workshop_gdg_cali/src/pages/utils/locator.dart';


Future<void> main() async {
  try {
    await setupLocator();
    runApp(MyApp());
  } catch (error) {
    print("Locator setup failed $error");
  }
}
