import 'package:adota_pet/helpers/buttons.dart';
import 'package:adota_pet/widgets/card.dart';
import 'package:adota_pet/widgets/copyright_footer.dart';
import 'package:flutter/material.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:firebase_picture_uploader/firebase_picture_uploader.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';


class DenouncePage extends StatefulWidget {

  static const String routeName = '/denounce';

  @override
  _DenouncePageState createState() => _DenouncePageState();
}

class _DenouncePageState extends State<DenouncePage> {
  @override

  var _textFieldController = new TextEditingController();

  Widget build(BuildContext context) {

    var widgetsList = <Widget> [
      // _list(),

      _body(),

      new CopyrightFooter()
    ];

    return DefaultPage(
      back: true,
      search: false,
      elements: widgetsList,
      title: 'Denúncias',
    );
  }

  Widget _body() {

    return CustomCard(
      body: <Widget>[
        _denounceContact(),
        Divider(),
        _denounceForm()
      ],
    );
  }


  Widget _denounceContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Ligue para',
          style: TextStyle(
            fontSize: 15.0
          ),
        ),
        GestureDetector(
          onTap: () => launch('tel://0800 61 8080'),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.local_phone,
              ),
              SizedBox(width: 5.0,),
              Text(
                '0800 61 8080',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _denounceForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'ou nos envie uma mensagem utilizando o formulário abaixo',
          style: TextStyle(
            fontSize: 15.0
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          controller: _textFieldController,
          autofocus: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 25.0,
            ),
            labelText: "Digite aqui a sua denúncia anônima...",
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(20.0)
            )
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Obs: Denúncia feita de forma completamente anônima!',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10.0),
        ButtonsHelper.roundedBtn(
          label: 'Enviar',
          fontSize: 20.0,
          borderRadius: 25.0,
          action: () => {

          }
        )
      ],
    );
  }

}
