import 'package:adota_pet/helpers/redirect.dart';
import 'package:adota_pet/views/animals_list_page.dart';
import 'package:adota_pet/views/denounce_page.dart';
import 'package:adota_pet/views/publish_animal.dart';
import 'package:adota_pet/widgets/animal_tile.dart';
import 'package:adota_pet/widgets/copyright_footer.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RootPage extends StatefulWidget {

  static const String routeName = '/root';

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  @override
  Widget build(BuildContext context) {

    var widgetsList = <Widget> [
      _moreOptions(),
      SizedBox(height: 20.0),
      // Trending items
      _trending(),
      _trendingVerticalList(context),

      // More options wrapper

      new CopyrightFooter()
    ];

    return DefaultPage(
      elements: widgetsList,
    );
  }

  Widget _trending({String title, icon}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon ?? Icons.timer,
                size: 30.0,
                color: Colors.white,
              ),
              SizedBox(width: 10.0,),
              Text(
                title ?? "Recentes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          GestureDetector(
            child: Icon(
              Icons.add,
              size: 35.0,
              color: Colors.white
            ),
            onTap: () {
              Redirect.popUp(context, new AnimalsListPage());
            },
          )
        ],
      ),
    );
  }

  // Vertical trending list.
  Widget _trendingVerticalList(context) {
    return StreamBuilder(

      stream: Firestore.instance.collection('animals').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Text('Loading');

        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (context, index) {
            return AnimalTile(animal: snapshot.data.documents[index]);
          }
        );
      },
    );
  }

  // More options
  Widget _moreOptions() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 18.0
      ),
      child: Container(
        height: 140.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        padding: EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _circleBtn(
              Icons.add,
              'Publicar',
              () {
                Redirect.popUp(context, new PublishAnimal());
              }
            ),
            _circleBtn(
              Icons.report_problem,
              'Denunciar maus-tratos',
              () {
                Redirect.popUp(context, new DenouncePage());
              }
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleBtn(IconData icon, text, callback) {
    return Column(
      children: <Widget>[
        RawMaterialButton(
          onPressed: callback,
          elevation: 2.0,
          fillColor: Colors.grey[200],
          child: Icon(
            icon,
            size: 35.0,
            color: Colors.grey[850],
          ),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        ),
        SizedBox(height: 10.0),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[850]
          ),
        )
      ],
    );
  }
}





