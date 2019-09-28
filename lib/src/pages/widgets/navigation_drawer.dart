import 'package:flutter/material.dart';
import 'package:workshop_gdg_cali/src/pages/widgets/header_drawer.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        children: <Widget>[
          HeaderDrawer(),
          ListTile(
              title: Text("Inicio"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/home');
              }),
          ListTile(
              title: Text("Mapa"),
              leading: Icon(Icons.map),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/maps');
              }),
          ListTile(
              title: Text("Usuarios"),
              leading: Icon(Icons.supervised_user_circle),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/users');
              }),
          Divider(),
          ListTile(
            title: Text("Cerrar Sesión"),
            leading: Icon(Icons.exit_to_app),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  ListTile getNavItem(
      IconData itemIcon, String itemName, String itemRouteName) {
    return ListTile(
      leading: Icon(itemIcon),
      title: Text(itemName),
      onTap: () {
        setState(() {
          // pop closes the drawer
          Navigator.of(context).pop();
          // navigate to the route
          Navigator.of(context).pushNamed(itemRouteName);
        });
      },
    );
  }
}
