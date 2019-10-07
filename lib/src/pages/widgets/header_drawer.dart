import 'package:flutter/material.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({
    Key key,
    @required this.email,
    @required this.fullname,
    @required this.photoURL,
  }) : super(key: key);

  final String email;
  final String fullname;
  final String photoURL;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return UserAccountsDrawerHeader(
      accountEmail: Text(email),
      accountName: Text(fullname),
      currentAccountPicture: GestureDetector(
        child: photoURL.isNotEmpty
            ? CircleAvatar(
                backgroundImage: NetworkImage(photoURL),
              )
            : CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
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
