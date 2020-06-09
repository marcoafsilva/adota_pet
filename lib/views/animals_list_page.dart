import 'package:adota_pet/widgets/animal_tile.dart';
import 'package:adota_pet/widgets/copyright_footer.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnimalsListPage extends StatefulWidget {

  static const String routeName = '/animalsList';

  @override
  _AnimalsListPageState createState() => _AnimalsListPageState();
}

class _AnimalsListPageState extends State<AnimalsListPage> {

  @override
  Widget build(BuildContext context) {

    var widgetsList = <Widget> [
      _list(),
      new CopyrightFooter()
    ];

    return DefaultPage(
      back: true,
      search: true,
      elements: widgetsList,
      title: 'Listagem',
    );
  }

  Widget _list() {
    return StreamBuilder(

      stream: Firestore.instance.collection('animals').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Text('Loading');

        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          reverse: true,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) {
            return AnimalTile(animal: snapshot.data.documents[index]);
          }
        );
      },
    );
  }
}
