import 'package:flutter/material.dart';
import 'package:workshop_gdg_cali/src/pages/home/home_page.dart';
import 'package:workshop_gdg_cali/src/pages/maps/maps_page.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
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
                    fit: BoxFit.fill)
            ),
          ),
          ListTile(
              title: Text("Inicio"),
              trailing: Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/home');
              }),
          ListTile(
              title: Text("Mapa"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/maps');
              }),
          Divider(),
          ListTile(
            title: Text("Cancel"),
            trailing: Icon(Icons.cancel),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
