import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _showHeader(),
          ListTile(
            title: Text('Início'),
            // subtitle: Text('sub título'),
          )
        ],
      ),
    );
  }


  Widget _showHeader() {
    String _userName = 'Marco Silva';
    String _userMail = 'marcoaurelio.fs@hotmail.com';

    return UserAccountsDrawerHeader(
      accountName: Text(_userName),
      accountEmail: Text(_userMail),
      currentAccountPicture: CircleAvatar(
        child: Text(_userName.substring(0, 1))
      ),
    );
  }
}