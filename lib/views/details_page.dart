import 'package:adota_pet/models/animal.dart';
import 'package:adota_pet/widgets/boxed_container.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:screen/screen.dart';

class DetailsPage extends StatelessWidget {

  static const String routeName = '/details';
  final Animal animal;

  const DetailsPage({
    Key key,
    @required this.animal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Screen.keepOn(true);
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      backgroundColor: Color.fromRGBO(255, 255, 255, .9),
    );
  }

  /**
   * App Bar builder
   */
  Widget _buildAppBar() {
    return AppBar(
      title: Text('Detalhes'),
    );
  }

  /**
   * Body builder!!!! BIIRRLL
   */
  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          _animalDetails()
        ],
      ),
    );
  }


  Widget _animalDetails() {
    return Column(
      children: <Widget>[
        BoxedContainer(
          title: animal.title,
          content: Column(
            children: <Widget>[
              GestureDetector(
                child: Image.network(animal.img),
                onTap: () {
                  // PhotoView(
                  //   imageProvider: NetworkImage(animal.img),
                  // )
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                   
                  children: <Widget>[
                    _rowInfo('Cidade', animal.city + ' - ' + animal.state),
                    _rowInfo('Idade', animal.age + ' meses'),
                    Divider(),
                    RaisedButton(
                      color: Colors.blueAccent,
                      child: Text('Ver no mapa', style: TextStyle(color: Colors.white),),
                      onPressed: () {

                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Text('olá mundo!', style: TextStyle( color: Colors.white ),)
      ],
    );
  }

  Widget _rowInfo(element, value) {
    return Row(
      children: <Widget>[
        Text(
          element + ': ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0
          ),

        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0
          ),

        )
      ],
    );
  }
}
