import 'package:adota_pet/helpers/redirect.dart';
import 'package:adota_pet/views/animals_list_page.dart';
import 'package:adota_pet/views/my_animals_page.dart';
import 'package:adota_pet/views/root_page.dart';
import 'package:adota_pet/views/sign_in_page.dart';
import 'package:adota_pet/views/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:adota_pet/helpers/globals.dart' as globals;

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
            action: () => Redirect.popUp(context, new RootPage()),
            icon: Icons.home
          ),
          _menuItem(
            title: 'Animais',
            action: () => Redirect.popUp(context, new AnimalsListPage()),
            icon: Icons.pets
          ),
          Divider(),
          _userActions()
        ],
      ),
    );
  }

  Widget _showHeader() {
    String _userName = 'Marco Silva';
    String _userMail = globals.userData['email'];

    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1b1e44),
            Color(0xFF2d3447),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )
      ),
      // accountName: Text(_userName),
      accountEmail: Text(_userMail),
      currentAccountPicture:
          CircleAvatar(
            child: Text(_userMail.substring(0, 1).toUpperCase())
          ),
    );
  }

  Widget _menuItem({String title, action, icon}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon, color: Color(0xFF1b1e44),),
          SizedBox(width: 10.0),
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF1b1e44)
            ),
          )
        ],
      ),
      onTap: action,
    );
  }

  Widget _userActions() {

    // If user is not logged in.
    if (!globals.isLoggedIn) {

      return Column(
        children: [
          _menuItem(
            title: 'Login',
            action: () => Redirect.popUp(context, new SignInPage()),
            icon: Icons.filter_drama
          ),
          _menuItem(
            title: 'Novo Cadastro',
            action: () => Redirect.popUp(context, new SignUpPage()),
            icon: Icons.control_point
          ),
        ],
      );

    } else {

      return Column(
        children: [
          _menuItem(
            title: 'Meus animais',
            action: () => Redirect.popUp(context, new MyAnimalsPage()),
            icon: Icons.format_list_numbered
          ),
          Divider(),
          _menuItem(
            title: 'Sair',
            action: () => {
              globals.isLoggedIn = false,
              globals.userData['uid'] = '',
              globals.userData['email'] = 'Anônimo',
              Redirect.pushUp(context)
            },
            icon: Icons.undo
          )
        ],
      );
    }
  }
}
