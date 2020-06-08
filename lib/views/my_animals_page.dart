import 'package:adota_pet/widgets/copyright_footer.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:flutter/material.dart';

class MyAnimalsPage extends StatefulWidget {
  @override
  _MyAnimalsPageState createState() => _MyAnimalsPageState();
}

class _MyAnimalsPageState extends State<MyAnimalsPage> {
  @override
  Widget build(BuildContext context) {
    var widgetsList = <Widget> [
      new CopyrightFooter()
    ];

    return DefaultPage(
      back: true,
      search: false,
      elements: widgetsList,
      title: 'Meus Animais',
    );
  }
}
