import 'package:adota_pet/widgets/animal_tile.dart';
import 'package:adota_pet/widgets/copyright_footer.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:adota_pet/helpers/animal_filters.dart' as _f;

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

    CollectionReference c = Firestore.instance.collection('animals');

    // Filter enabled animals
    Query query = c.where(
      "enable",
      isEqualTo: true
    );

    if (_f.isFiltering) {
      // Filter animal colors
      if (_f.filteringFor.toString().contains('color')) {
        query = query.where(
          "color",
          isEqualTo: _getVal('color')
        );
      }

      // Filter animal colors
      if (_f.filteringFor.toString().contains('age')) {
        query = query.where(
          "age",
          isEqualTo: _getVal('age')
        );
      }

      // Filter animal colors
      if (_f.filteringFor.toString().contains('size')) {
        query = query.where(
          "size",
          isEqualTo: _getVal('size')
        );
      }
    }

    return StreamBuilder(

      stream: query.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();

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


  String _getVal(search) {

    for (var val in _f.filteringFor) {
      return val[search] ?? null;
    }

    // return _f.filteringFor.
  }
}
