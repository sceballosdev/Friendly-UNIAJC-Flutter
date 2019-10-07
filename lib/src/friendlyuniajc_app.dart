import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:workshop_gdg_cali/src/pages/login/bloc/bloc_user.dart';
import 'package:workshop_gdg_cali/src/pages/login/login_page.dart';
import 'package:workshop_gdg_cali/src/pages/maps/maps_page.dart';
import 'package:workshop_gdg_cali/src/providers/push_notification_provider.dart';
import 'package:workshop_gdg_cali/src/routes/routes.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final pushProvider = PushNotificationProvider();
    pushProvider.initNotifications();

    pushProvider.messages.listen((data) {
      navigatorKey.currentState.pushNamed(MapsPage.routeName, arguments: data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
            title: 'Friendly UNIAJC',
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            theme: ThemeData(primarySwatch: Colors.indigo),
            home: LoginPage(),
            routes: getApplicationRoutes()),
        bloc: UserBloc());
  }
}
