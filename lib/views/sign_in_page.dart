import 'package:adota_pet/views/default_scaffold.dart';
import 'package:adota_pet/widgets/boxed_container.dart';
import 'package:adota_pet/widgets/my_container.dart';
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
    return DefaultScaffold.view('Login', MyContainer(body: _bodyBuilder()));
  }

  Widget _bodyBuilder() {
    return Column(
      children: <Widget>[
        BoxedContainer(
          title: 'Fazer login',
          content: _body(),
          btnAction: () => _submitBtnAction(),
          btnText: 'Entrar',
        )
      ],
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        _loginField(),
        _passwordField(),
      ],
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