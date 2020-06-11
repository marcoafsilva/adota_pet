import 'package:adota_pet/widgets/animal_tile.dart';
import 'package:adota_pet/widgets/copyright_footer.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:adota_pet/helpers/globals.dart' as globals;

class MyAnimalsPage extends StatefulWidget {
  @override
  _MyAnimalsPageState createState() => _MyAnimalsPageState();
}

class _MyAnimalsPageState extends State<MyAnimalsPage> {
  @override
  Widget build(BuildContext context) {
    var widgetsList = <Widget> [
      _list(),
      new CopyrightFooter()
    ];

    return DefaultPage(
      back: true,
      search: false,
      elements: widgetsList,
      title: 'Meus Animais',
      addAnimal: true,
    );
  }

  Widget _list() {
    return StreamBuilder(

      stream: Firestore.instance.collection('animals').where(
        "userId",
        isEqualTo: globals.userData['uid']
      ).snapshots(),
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
              return AnimalTile(
                animal: snapshot.data.documents[index],
                showSwitch: true,
              );
            }
          );
        }
      },
    );
  }
}
