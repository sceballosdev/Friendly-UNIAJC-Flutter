import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:workshop_gdg_cali/src/pages/login/bloc/bloc_user.dart';
import 'package:workshop_gdg_cali/src/pages/login/login_page.dart';
import 'package:workshop_gdg_cali/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
            title: 'Friendly UNIAJC',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.indigo),
            initialRoute: LoginPage.routeName,
            routes: getApplicationRoutes()),
        bloc: UserBloc());
  }
}
