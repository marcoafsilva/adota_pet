import 'package:adota_pet/helpers/redirect.dart';
import 'package:adota_pet/views/animals_list_page.dart';
import 'package:adota_pet/views/root_page.dart';
import 'package:adota_pet/views/sign_in_page.dart';
import 'package:adota_pet/views/sign_up_page.dart';
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
          _menuItem(
            title: 'Início',
            action: new RootPage(),
            icon: Icons.home
          ),
          _menuItem(
            title: 'Animais',
            action: new AnimalsListPage(),
            icon: Icons.android
          ),
          Divider(),
          _menuItem(
            title: 'Login',
            action: new SignInPage(),
            icon: Icons.filter_drama
          ),
          _menuItem(
            title: 'Novo Cadastro',
            action: new SignUpPage(),
            icon: Icons.control_point
          ),
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
      currentAccountPicture:
          CircleAvatar(child: Text(_userName.substring(0, 1))),
    );
  }

  Widget _menuItem({String title, action, icon = null}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          icon != null ? Padding(padding: EdgeInsets.only(right: 10.0), child: Icon(icon),) : Text(''),
          Text(title)
        ],
      ),
      onTap: () => Redirect.popUp(context, action),
    );
  }
}
