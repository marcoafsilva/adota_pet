import 'package:adota_pet/helpers/buttons.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:adota_pet/widgets/text_input_field.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {

  static const String routeName = '/signIn';

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  var _loginFieldController = new TextEditingController();
  var _passwordFieldController = new TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: 'Login',
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
            ButtonsHelper.roundedBtn(
              label: 'Entrar',
              fontSize: 20.0
            )
            // _submitBtnAction(),  
          ],
        ),
      ),
    );
  }

  Widget _loginField() {
    return TextInputField(
      label: 'Usuário',
      controller: _loginFieldController,
    );      
  }

  Widget _passwordField() {
    return TextInputField(
      label: 'Senha',
      controller: _passwordFieldController,
    );        
  }

  void _submitBtnAction() {

  }

}