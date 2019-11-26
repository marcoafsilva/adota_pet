// import 'package:adota_pet/models/animal.dart';
import 'package:adota_pet/helpers/buttons.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:flutter/material.dart';
import 'package:screen/screen.dart';

class DetailsPage extends StatelessWidget {

  static const String routeName = '/details';
  // final Animal animal;
  final animal;

  const DetailsPage({
    Key key,
    @required this.animal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Screen.keepOn(true);

    var widgetsList = <Widget> [
      _animalDetails(context)
    ];
    
    return DefaultPage(
      back: true,
      search: false,
      elements: widgetsList,
      title: 'Detalhes',
    );
  }

  Widget _animalDetails(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                      Text(
                        animal.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        )
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.cake, size: 20.0, color: Colors.grey,),
                          SizedBox(width: 5.0),
                          Text(
                            animal.age + ' meses', 
                            style: TextStyle(
                              fontSize: 20.0
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.map, size: 20.0, color: Colors.grey,),
                          SizedBox(width: 5.0),
                          Text(
                            animal.city + ' - ' + animal.state, 
                            style: TextStyle(
                              fontSize: 20.0
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Divider(),
                      SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ButtonsHelper.roundedBtn(
                            label: 'Ver no mapa',
                            icon: Icons.map
                          ),
                          ButtonsHelper.roundedBtn(
                            label: 'Contactar',
                            icon: Icons.phone
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(animal.img),
                fit: BoxFit.fitHeight
              )
            ),
          ),  
        ],
      ),
    );
  }


}
