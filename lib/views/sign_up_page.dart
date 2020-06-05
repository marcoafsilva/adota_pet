import 'package:adota_pet/helpers/buttons.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:adota_pet/widgets/text_input_field.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {

  static const String routeName = '/signUp';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  // Controllers
  var _nameFieldController = new TextEditingController();
  var _phoneFieldController = new TextEditingController();
  var _mailFieldController = new TextEditingController();
  var _passwordFieldController = new TextEditingController();

  // States/Cities
  List<String> states = [
    'São Paulo'
  ];

  List<String> cities = [
    'Campinas',
    'Mogi Guaçu',
    'Mogi Mirim'
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: 'Cadastre-se',
      elements: <Widget>[
        _body(),
        SizedBox(height: 50.0,)
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
            _nameField(),
            SizedBox(height: 10.0),
            _phoneField(),
            SizedBox(height: 10.0),
            _stateField(),
            SizedBox(height: 10.0),
            _cityField(),
            SizedBox(height: 10.0),
            _mailField(),
            SizedBox(height: 10.0),
            _passwordField(),
            SizedBox(height: 10.0),
            _passwordField(),
            SizedBox(height: 10.0),
            Divider(),
            SizedBox(height: 10.0),
            ButtonsHelper.roundedBtn(
              label: 'Cadastrar!',
              fontSize: 20.0
            ),
            // _submitBtnAction(),
          ],
        ),
      ),
    );
  }


  Widget _nameField() {
    return TextInputField(
      label: 'Nome',
      controller: _nameFieldController,
    );
  }

  Widget _phoneField() {
    return TextInputField(
      label: 'Telefone',
      controller: _phoneFieldController,
    );
  }

  Widget _stateField() {
    return DropDownField(
      hintText: 'Estado',
      items: states,
    );
  }

  Widget _cityField() {
    return DropDownField(
      hintText: 'Cidade',
      items: cities,
    );
  }

  Widget _mailField() {
    return TextInputField(
      label: 'E-mail',
      controller: _mailFieldController,
    );
  }

  Widget _passwordField() {
    return TextInputField(
      label: 'Senha de acesso',
      controller: _passwordFieldController,
    );
  }


  void _submitBtnAction() {

  }
}
