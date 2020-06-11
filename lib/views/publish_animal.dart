import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:adota_pet/helpers/buttons.dart';
import 'package:adota_pet/widgets/card.dart';
import 'package:adota_pet/widgets/copyright_footer.dart';
import 'package:adota_pet/widgets/text_input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:adota_pet/helpers/animal_filters.dart' as _animalFilters;
import 'package:image_picker/image_picker.dart';
import 'package:adota_pet/helpers/globals.dart' as globals;

class PublishAnimal extends StatefulWidget {

  static const String routeName = '/publishAnimal';

  @override
  _PublishAnimalState createState() => _PublishAnimalState();
}

class _PublishAnimalState extends State<PublishAnimal> {

  // Vars
  var _animalName = new TextEditingController();
  // var _animalAge = new TextEditingController();
  String _animalAge = 'Idade';
  // var _animalColor = new TextEditingController();
  String _animalColor = 'Cor';
  // var _animalSize = new TextEditingController();
  String _animalSize = 'Tamanho';
  var _animalHistory = new TextEditingController();
  var _animalHealthIssues = new TextEditingController();
  var _animalAdaptation = new TextEditingController();

  Uint8List _bytesImage;
  File _image;
  String  base64Image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {

    var widgetsList = <Widget> [
      CustomCard(
        body: <Widget>[
          _animalNameField(),
          SizedBox(height: 10.0),
          _dropdownElement('age', _animalAge, _animalFilters.filter['age']),
          SizedBox(height: 10.0),
          _dropdownElement('color', _animalColor, _animalFilters.filter['color']),
          SizedBox(height: 10.0),
          _dropdownElement('size', _animalSize, _animalFilters.filter['size']),
          SizedBox(height: 10.0),
          _animalHistoryField(),
          SizedBox(height: 10.0),
          _animalHeathIssuesField(),
          SizedBox(height: 10.0),
          _animalAdaptationField(),

          Divider(),

          _uploadImage(),

          Divider(),

          ButtonsHelper.roundedBtn(
            label: 'Publicar!',
            fontSize: 20.0,
            borderRadius: 25.0,
            action: () {
              Firestore.instance
                  .collection('animals')
                  .add({
                    // Animal data
                    "name": _animalName.text,
                    "age": _animalAge,
                    "color": _animalColor,
                    "size": _animalSize,
                    "history": _animalHistory.text,
                    "healthIssues": _animalHealthIssues.text,
                    "adaptation": _animalAdaptation.text,
                    "blobImg": base64Image,
                    "enable": true,

                    // User data
                    "phone": globals.userData['phone'],
                    "state": globals.userData['state'],
                    "city": globals.userData['city'],
                    "userId": globals.userData['uid'],
                })
                .then((result) => {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Sucesso!'),
                        content: Text('Animal publicado com sucesso!'),
                        actions: [
                          FlatButton(
                            child: Text('OK',),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                              Navigator.of(context).pop(true);
                            },
                          )
                        ],
                      );
                    }
                  )
                })
                .catchError((err) => print(err));
            }
          )
        ]
      ),
      new CopyrightFooter()
    ];

    return DefaultPage(
      back: true,
      search: false,
      title: 'Publicar',
      elements: widgetsList,
    );
  }

  Widget _animalNameField() {
    return TextInputField(
      label: 'Nome',
      controller: _animalName,
      borderRadius: 20.0,
    );
  }


  Widget _animalHistoryField() {
    return TextInputField(
      label: 'Descrição',
      controller: _animalHistory,
      multiline: true,
      borderRadius: 20.0,
    );
  }

  Widget _animalHeathIssuesField() {
    return TextInputField(
      label: 'Problemas de saúde',
      controller: _animalHealthIssues,
      multiline: true,
      borderRadius: 20.0,
    );
  }

  Widget _animalAdaptationField() {
    return TextInputField(
      label: 'Adaptação',
      controller: _animalAdaptation,
      multiline: true,
      borderRadius: 20.0,
    );
  }

  Widget _dropdownElement(title, current, values) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.grey[500],
            style: BorderStyle.solid,
            width: 1.0
          )
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            items: values.map<DropdownMenuItem<String>>((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String selectedItem) {
              setState(() {
                switch (title) {
                  case 'color':
                    _animalColor = selectedItem;
                    break;
                  case 'age':
                    _animalAge = selectedItem;
                    break;
                  case 'size':
                    _animalSize = selectedItem;
                    break;
                }
              });
            },
            value: current,
        )
        ),
      ),
    );
  }

  Widget _uploadImage() {
    return GestureDetector(
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.grey[500],
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: _imageBoxContent(),
        ),
      ),
      onTap: () => getImage(),
    );
  }

  Widget _imageBoxContent() {
    if (_image == null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.image),
          SizedBox(width: 10.0,),
          Text('Enviar imagem')
        ],
      );
    } else {
      return Image.file(_image);
    }
  }

  Future getImage() async {
    // final pickedFile = await picker.getImage(source: ImageSource.gallery);

    var image2 = await ImagePicker.pickImage(
      source: ImageSource.gallery,

      );
    List<int> imageBytes = image2.readAsBytesSync();
    base64Image = base64Encode(imageBytes);

    _bytesImage = Base64Decoder().convert(base64Image);

    setState(() {
      // _image = File(pickedFile.path);
      _image=image2;
    });
  }
}
