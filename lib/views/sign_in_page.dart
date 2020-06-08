import 'package:adota_pet/helpers/auth.dart';
import 'package:adota_pet/helpers/buttons.dart';
import 'package:adota_pet/helpers/redirect.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:adota_pet/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:adota_pet/helpers/globals.dart' as globals;

class SignInPage extends StatefulWidget {

  static const String routeName = '/signIn';

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  // Fields controllers.
  var _emailFieldController = new TextEditingController();
  var _passwordFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: 'Login',
      back: true,
      elements: <Widget>[
        _body()
      ],
    );
  }

  Widget _body() {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            _loginField(),
            SizedBox(height: 10.0),
            _passwordField(),
            SizedBox(height: 10.0),
            Divider(),
            SizedBox(height: 10.0),
            ButtonsHelper.roundedBtn(
              label: 'Entrar',
              fontSize: 20.0,
              action: () => _loginBtn()
            )
            // _su(),
          ],
        ),
      ),
    );
  }

  Widget _loginField() {
    return TextInputField(
      label: 'Usuário',
      controller: _emailFieldController,
    );
  }

  Widget _passwordField() {
    return TextInputField(
      label: 'Senha',
      controller: _passwordFieldController,
    );
  }


  Future<FirebaseUser> _loginBtn() async {

    var authHandler = new Auth();

    authHandler.handleSignInEmail(
      _emailFieldController.text, _passwordFieldController.text)
    .then((FirebaseUser user) {

      if (user != null) {
        globals.isLoggedIn = true;
        globals.userData['uid'] = user.uid;
        globals.userData['email'] = user.email;

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sucesso!'),
              content: Text('Login efetuado com sucesso!'),
              actions: [
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Redirect.pushUp(context);
                    Redirect.pushUp(context);
                    Redirect.pushUp(context);
                  },
                )
              ],
            );
          }
        );


      } else {
        globals.isLoggedIn = false;
        globals.userData['uid'] = '';
        globals.userData['email'] = 'Anônimo';

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Ops!'),
              content: Text(
                'Dados de e-mail/senha incorretos!',
                style: TextStyle(
                  color: Colors.red
                ),
              ),
              actions: [
                FlatButton(
                  child: Text('OK',),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                )
              ],
            );
          }
        );

      }

    }).catchError((e) => print(e));



  }

}
