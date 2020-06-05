import 'package:adota_pet/helpers/redirect.dart';
import 'package:adota_pet/views/details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnimalTile extends StatefulWidget {

  final DocumentSnapshot animal;

  const AnimalTile({
    @required this.animal
  });

  @override
  _AnimalTileState createState() => _AnimalTileState();
}

class _AnimalTileState extends State<AnimalTile> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        // print(widget.animal.documentID);
        Redirect.popUp(context, new DetailsPage(animalId: widget.animal.documentID));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(18.0, 0, 18.0, 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,

        ),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            // Image
            _image(widget.animal['img']),

            // Data
            _data(widget.animal['name'], widget.animal['city'], widget.animal['state']),
          ],
        )
      ),
    );
  }

  // Image widget
  Widget _image(img) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(9.0),
          topRight: Radius.circular(9.0)
        ),
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover
        )
      ),
    );
  }

  // Data widget
  Widget _data(name, city, state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          // Animal name
          Text(
            name,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15.0
            ),
          ),

          // Animal city
          Text(
            city + " - " + state,
            style: TextStyle(
              color: Colors.grey
            ),
          )
        ],
      ),
    );
  }
}
