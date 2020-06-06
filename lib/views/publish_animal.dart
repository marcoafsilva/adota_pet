import 'package:adota_pet/widgets/copyright_footer.dart';
import 'package:flutter/material.dart';
import 'package:adota_pet/widgets/default_page.dart';

class PublishAnimal extends StatefulWidget {

  static const String routeName = '/publishAnimal';

  @override
  _PublishAnimalState createState() => _PublishAnimalState();
}

class _PublishAnimalState extends State<PublishAnimal> {
  @override
  Widget build(BuildContext context) {

    var widgetsList = <Widget> [

      new CopyrightFooter()
    ];

    return DefaultPage(
      back: true,
      search: false,
      elements: widgetsList,
      title: 'Publicar',
    );
  }

  Widget _body() {
    return Text('ehasuehsauhes');
  }
}
