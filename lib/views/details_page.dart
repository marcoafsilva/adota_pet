import 'dart:convert';
import 'package:adota_pet/helpers/buttons.dart';
import 'package:adota_pet/widgets/copyright_footer.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:screen/screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

class DetailsPage extends StatelessWidget {

  static const String routeName = '/details';
  final animalId;

  const DetailsPage({
    Key key,
    @required this.animalId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Screen.keepOn(true);


    var widgetsList = <Widget> [
      _animalDetails(context),
      new CopyrightFooter()
    ];

    return DefaultPage(
      back: true,
      search: false,
      elements: widgetsList,
      title: 'Detalhes',
    );
  }

  Widget _animalDetails(BuildContext context) {

    return new StreamBuilder(
        stream: Firestore.instance.collection('animals').document(animalId).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new CircularProgressIndicator();
          }

          var animal = snapshot.data;
          return _data(animal);
        }
    );
  }


  Widget _data(animalData) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 50.0
      ),
      child: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                SizedBox(height: 250.0),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _animalName(animalData['name']),
                      SizedBox(height: 10.0,),
                      _dataField(Icons.cake, "${animalData['age']}"),
                      _dataField(Icons.map, "${animalData['city']} - ${animalData['state']}"),
                      _dataField(Icons.color_lens, animalData['color']),
                      _dataField(Icons.photo_size_select_small, "Porte ${animalData['size']}"),
                      _dataField(Icons.info_outline, "${animalData['history']}"),
                      _dataField(Icons.healing, "${animalData['healthIssue']}"),
                      _dataField(Icons.info_outline, "${animalData['adaptation']}"),
                      Divider(),
                      SizedBox(height: 10.0,),
                      _animalActions(animalData)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 250.0,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: SizedBox.expand(child: _checkUrl(animalData['blobImg']),),
          ),
        ],
      ),
    );
  }

  Widget _animalName(value) {
    return Text(
      value,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      )
    );
  }


  Widget _dataField(IconData icon, title) {
    if (title != '' && title != null && title != 'null') {
      return Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(icon, size: 20.0, color: Colors.grey,),
              SizedBox(width: 5.0),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,)
        ],
      );
    } else {
      return SizedBox(height: 0);
    }
  }

  Widget _animalActions(animalData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ButtonsHelper.roundedBtn(
          label: 'Ver no mapa',
          icon: Icons.map,
          size: 'md',
          action: () => MapsLauncher.launchQuery("${animalData['city']} - ${animalData['state']}")
        ),
        SizedBox(height: 5.0),
        ButtonsHelper.roundedBtn(
          label: 'Contactar',
          icon: Icons.phone,
          size: 'md',
          action: () => launch("tel://${animalData['phone']}")
        )
      ],
    );
  }

  Image _checkUrl(img) {
    try {
      return Image.memory(
        base64.decode(img),
        fit: BoxFit.cover,
      );
    } catch (e) {
      return Image.network('https://firebasestorage.googleapis.com/v0/b/adota-pet-e7ee5.appspot.com/o/no-image.png?alt=media&token=7e34585a-3740-4392-b07e-53f1c87bd3fa', fit: BoxFit.cover,);
    }
  }
}
