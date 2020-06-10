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

        if (snapshot.data.documents.length == 0) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mood_bad,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      'Ops...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  'Nenhum animal disponível...',
                  style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w100
                      ),
                )
              ],
            ),
          );
        } else {
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
        }
      },
    );
  }
}
