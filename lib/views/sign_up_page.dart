import 'package:adota_pet/helpers/auth.dart';
import 'package:adota_pet/helpers/buttons.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:adota_pet/widgets/text_input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:adota_pet/helpers/animal_filters.dart' as _infos;
import 'package:adota_pet/helpers/globals.dart' as globals;

class SignUpPage extends StatefulWidget {

  static const String routeName = '/signUp';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  var authHandler = new Auth();

  FirebaseUser user;

  // Controllers
  var _nameFieldController = new TextEditingController();
  var _phoneFieldController = new MaskedTextController(mask: '(00) 0.0000-0000');
  var _mailFieldController = new TextEditingController();
  var _passwordFieldController = new TextEditingController();
  String _city = 'Cidade';
  String _state = 'Estado';

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: 'Cadastre-se',
      back: true,
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
            _dropdownElement('state', _state, _infos.geo['state']),
            SizedBox(height: 10.0),
            _dropdownElement('city', _city, _infos.geo['city']),
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
              action: () async {

                user = await authHandler.handleSignUp(_mailFieldController.text.trim(), _passwordFieldController.text);

                Firestore.instance.collection('users')
                  .document(user.uid)
                  .setData({
                  'city' : _city,
                  'state' : _state,
                  'phone' : _phoneFieldController.text,
                  'name' : _nameFieldController.text
                });

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Sucesso!'),
                      content: Text('Seja bem vindo ${globals.userData['name']}! \n\nSeu registro foi criado com sucesso!'),
                      actions: [
                        FlatButton(
                          child: Text('OK'),
                          onPressed: () {

                            globals.isLoggedIn = true;
                            globals.userData['uid'] = user.uid;
                            globals.userData['email'] = _mailFieldController.text;
                            globals.userData['phone'] = _phoneFieldController.text;
                            globals.userData['name'] = _nameFieldController.text;
                            globals.userData['city'] = _city;
                            globals.userData['state'] = _state;

                            Navigator.of(context).pop(true);
                            Navigator.of(context).pop(true);
                            Navigator.of(context).pop(true);
                          },
                        )
                      ],
                    );
                  }
                );

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
      borderRadius: 20.0,
    );
  }

  Widget _phoneField() {
    return TextInputField(
      label: 'Celular',
      controller: _phoneFieldController,
      borderRadius: 20.0,
    );
  }

  Widget _mailField() {
    return TextInputField(
      label: 'E-mail',
      controller: _mailFieldController,
      borderRadius: 20.0,
    );
  }

  Widget _passwordField() {
    return TextInputField(
      label: 'Senha de acesso',
      controller: _passwordFieldController,
      borderRadius: 20.0,
    );
  }


  Widget _dropdownElement(title, current, values) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.grey[500],
            style: BorderStyle.solid,
            width: 1.0
          )
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            items: values.map<DropdownMenuItem<String>>((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String selectedItem) {
              setState(() {
                switch (title) {
                  case 'city':
                    _city = selectedItem;
                    break;
                  case 'state':
                    _state = selectedItem;
                    break;
                }
              });
            },
            value: current,
        )
        ),
      ),
    );
  }

  void _submitBtnAction() {

  }
}
