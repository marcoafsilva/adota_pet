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
    print("Animal details: [" + animal.toString() + "]");
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
              Text('oi')
            ],
          ),
        ),
        Text('olá mundo!', style: TextStyle( color: Colors.white ),)
      ],
    );
  }
}
