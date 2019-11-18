import 'package:adota_pet/models/animal.dart';
import 'package:adota_pet/views/default_scaffold.dart';
import 'package:adota_pet/widgets/animal_tile.dart';
import 'package:adota_pet/widgets/boxed_container.dart';
import 'package:adota_pet/widgets/my_container.dart';
import 'package:flutter/material.dart';

class AnimalsListPage extends StatefulWidget {

  static const String routeName = '/animalsList';

  @override
  _AnimalsListPageState createState() => _AnimalsListPageState();
}

class _AnimalsListPageState extends State<AnimalsListPage> {


  final animalsList = <Animal>[
    new Animal(
      title : 'Pitoco',
      img   : 'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png',
      age   : '5',
      city  : 'Mogi Guaçu',
      state : 'SP'
    ),
    new Animal(
      title : 'Estopinha',
      img   : 'http://haloanimalshelter.co.za/wp-content/uploads/2017/10/Cute-Dog-Photography.jpg',
      age   : '5',
      city  : 'Mogi Mirim',
      state : 'SP'
    )
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultScaffold.view(
      'Todos os Animais', 
      MyContainer(body: _bodyBuilder(),)
    );
  }

  Widget _bodyBuilder() {
    return Column(
      children: <Widget>[
        BoxedContainer(
          title: "Confira abaixo:",
          content: _body(),
        )
      ],
    );
  }

  Widget _body() {
    return ListView(
      children: animalsList.map((animal) => AnimalTile(animal: animal)).toList(),
    );
  }
}