import 'dart:convert';
import 'package:adota_pet/helpers/globals.dart' as globals;
import 'package:adota_pet/helpers/redirect.dart';
import 'package:adota_pet/views/details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnimalTile extends StatefulWidget {

  final DocumentSnapshot animal;
  final bool showSwitch;

  const AnimalTile({
    @required this.animal,
    this.showSwitch = false
  });

  @override
  _AnimalTileState createState() => _AnimalTileState();
}

class _AnimalTileState extends State<AnimalTile> {

  bool switchStatus;

  @override
  void initState() {
    switchStatus = (widget.animal['enable'] == 'true');
    super.initState();
  }

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

            _image(widget.animal['blobImg']),

            // Data
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0
              ),
              child: Row(
                children: [
                  Flexible(child: _data(widget.animal['name'], widget.animal['city'], widget.animal['state'])),
                  (globals.isLoggedIn && widget.showSwitch ? _switch() : Text('')),
                ],
              ),
            )
          ],
        )
      ),
    );
  }

  // Image widget
  Widget _image(img) {
    return Container(
      height: 200.0,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(9.0),
          topRight: Radius.circular(9.0)
        ),
      ),
      child: SizedBox.expand(child: _checkUrl(img),),
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

  // Data widget
  Widget _data(name, city, state) {
    return Column(
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
          "${city} - ${state}",
          style: TextStyle(
            color: Colors.grey
          ),
        )
      ],
    );
  }

  Widget _switch() {

    return Tooltip(
      message: 'Alterar status',
      preferBelow: false,
      child: Switch(
        value: switchStatus,
        onChanged: (bool newValue) {
          // print(value);
          setState(() {
            switchStatus = newValue;
          });
          _dialog(newValue);
        },
      ),
    );
  }

  Widget _dialog(newValue) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {

        return AlertDialog(
          title: Text('Alterar status'),
          content: Text('Você realmente deseja alterar o status deste animal?'),
          actions: [
            FlatButton(
              child: Text('Sim'),
              onPressed: () {

                Firestore.instance.collection('animals').document(widget.animal.documentID).updateData({
                  "enable": newValue
                });

                Redirect.pushUp(context);
              },
            ),
            FlatButton(
              child: Text('Não'),
              onPressed: () {
                setState(() {
                  switchStatus = !newValue;
                });
                Redirect.pushUp(context);
              },
            )
          ],
        );
      }
    );
  }
}
