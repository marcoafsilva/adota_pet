import 'package:adota_pet/helpers/buttons.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:adota_pet/widgets/text_input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';

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
    'Mogi Mirim',
    'Itapira',
    'Estiva Gerbi',
    'Espírito Santo do Pinhal'
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
            Divider(),
            SizedBox(height: 10.0),
            ButtonsHelper.roundedBtn(
              label: 'Cadastrar!',
              fontSize: 20.0,
              action: () => {
                Firestore.instance.collection('users').add({
                  'city' : 'Mogi Guaçu',
                  'state' : 'SP',
                  'pass' : _passwordFieldController.text,
                  'phone' : _phoneFieldController.text,
                  'name' : _nameFieldController.text
                }),
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Sucesso!'),
                      content: Text('Seu registro foi criado com sucesso!'),
                      actions: [
                        FlatButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                            Navigator.of(context).pop(true);
                            Navigator.of(context).pop(true);
                          },
                        )
                      ],
                    );
                  }
                )
              }
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
    return MaskedTextField(
      maskedTextFieldController: _phoneFieldController,
      mask: "(xx) x.xxxx-xxxx",
      maxLength: 16,
      keyboardType: TextInputType.number,
      inputDecoration: InputDecoration(
        labelText: "Telefone",
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0),
          ),
          borderRadius: BorderRadius.circular(50.0)
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 25.0,
        ),
      ),
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
