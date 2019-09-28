import 'package:flutter/material.dart';

class HeaderDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return UserAccountsDrawerHeader(
      accountEmail: Text("sceballosdev@gmail.com"),
      accountName: Text("Steven Ceballos"),
      currentAccountPicture: GestureDetector(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
        onTap: () => print("Evento por si se clickea la foto"),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/header_drawer.jpg'),
              fit: BoxFit.fill)),
    );
  }
}
