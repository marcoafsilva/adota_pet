import 'package:adota_pet/views/default_scaffold.dart';
import 'package:adota_pet/widgets/boxed_container.dart';
import 'package:adota_pet/widgets/my_container.dart';
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
    return DefaultScaffold.view('Novo Cadastro', MyContainer(body: _bodyBuilder()));
  }

  Widget _bodyBuilder() {
    return BoxedContainer(
      title: 'Novo Cadastro',
      content: _body(),
      btnText: 'Cadastrar!',
      btnAction: () => _submitBtnAction(),
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        _nameField(),
        _phoneField(),
        _stateField(),
        _cityField(),
        _mailField(),
        _passwordField(),
        
      ],
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