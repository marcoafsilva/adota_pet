import 'package:adota_pet/helpers/buttons.dart';
import 'package:adota_pet/widgets/copyright_footer.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:screen/screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {

  static const String routeName = '/details';
  // final Animal animal;
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
            return new Text("Loading");
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
                      _dataField(Icons.cake, "${animalData['age']} meses"),
                      SizedBox(height: 10.0),
                      _dataField(Icons.map, "${animalData['city']} - ${animalData['state']}"),
                      SizedBox(height: 10.0,),
                      _dataField(Icons.color_lens, animalData['color']),
                      SizedBox(height: 10.0,),
                      _dataField(Icons.photo_size_select_small, "Porte ${animalData['size']}"),
                      SizedBox(height: 10.0,),
                      _dataField(Icons.info_outline, 'Amiguinho extremamente dócil. Adora brincadeiras e também de roer seu ossinho. Excelente companhia para quem ainda não possui um animalzinho de estimação.'),
                      Divider(),
                      SizedBox(height: 10.0,),
                      _animalActions()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(animalData['img']),
                fit: BoxFit.cover
              )
            ),
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
    return Row(
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
        )
      ],
    );
  }

  Widget _animalActions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ButtonsHelper.roundedBtn(
          label: 'Ver no mapa',
          icon: Icons.map,
          size: 'md',
          action: () => {

          }
        ),
        SizedBox(height: 5.0),
        ButtonsHelper.roundedBtn(
          label: 'Contactar',
          icon: Icons.phone,
          size: 'md',
          action: () => launch('tel://')
        )
      ],
    );
  }
}
