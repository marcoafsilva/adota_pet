import 'package:flutter/material.dart';
import 'package:screen/screen.dart';

class DetailsPage extends StatefulWidget {
  static const String routeName = '/details';
  final String name;

  const DetailsPage({
    this.name
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
        Text('olá mundo!'),
        Text('olá mundo!', style: TextStyle( color: Colors.white ),)
      ],
    );
  }

}
