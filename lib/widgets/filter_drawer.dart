import 'package:adota_pet/helpers/redirect.dart';
import 'package:adota_pet/views/animals_list_page.dart';
import 'package:adota_pet/views/my_animals_page.dart';
import 'package:adota_pet/views/root_page.dart';
import 'package:adota_pet/views/sign_in_page.dart';
import 'package:adota_pet/views/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:adota_pet/helpers/globals.dart' as globals;
import 'package:adota_pet/helpers/animal_filters.dart' as _animalFilters;

class FilterDrawer extends StatefulWidget {
  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {

  String _color = 'Selecione';
  final _colors = <String>['Selecione', 'Todos', 'Branco', 'Preto', 'Caramelo', 'Mesclado'];

  String _size = 'Selecione';
  final _sizes = <String>['Selecione', 'Todos', 'Pequeno', 'Médio', 'Grande'];

  String _age = 'Selecione';
  final _ages = <String>['Selecione', 'Todos', 'Filhote', 'Adulto', 'Idoso'];

  @override
  Widget build(BuildContext context) {


    return Drawer(
      child: ListView(
        children: <Widget>[
          _title(),
          Divider(),
          _filter('Cor: ', _color, _colors),
          _filter('Idade: ', _age, _ages),
          _filter('Tamanho: ', _size, _sizes),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: RaisedButton(
              child: Text('Filtrar'),
              onPressed: () {

              },
            ),
          )

        ],
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        'Filtrar por:',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0
        ),
      ),
    );
  }

  Widget _filter(title, el, list) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            Text(title),
            SizedBox(width: 20.0,),
            _dropdownItem(title.toLowerCase().replaceAll(': ', ''), el, list),
          ],
        ),
      ),
    );
  }

  Widget _dropdownItem(title, current, values) {

    return DropdownButton<String>(
      items: values.map<DropdownMenuItem<String>>((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String selectedItem) {
        setState(() {
          switch (title) {
            case 'cor':
              _color = selectedItem;
              break;
            case 'idade':
              _age = selectedItem;
              break;
            case 'tamanho':
              _size = selectedItem;
              break;
          }
        });
      },
      hint: Text('Selecione'),
      value: current,
    );
  }
}
