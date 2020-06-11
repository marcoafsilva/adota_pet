import 'package:adota_pet/helpers/redirect.dart';
import 'package:adota_pet/views/animals_list_page.dart';
import 'package:flutter/material.dart';
import 'package:adota_pet/helpers/animal_filters.dart' as _animalFilters;

class FilterDrawer extends StatefulWidget {
  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {

  String _color = 'Cor';
  String _size = 'Tamanho';
  String _age = 'Idade';

  @override
  Widget build(BuildContext context) {


    return Drawer(
      child: ListView(
        children: <Widget>[
          _title(),
          Divider(),
          _filter('Cor: ', _color, _animalFilters.filter['color']),
          _filter('Idade: ', _age, _animalFilters.filter['age']),
          _filter('Tamanho: ', _size, _animalFilters.filter['size']),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: RaisedButton(
              child: Text('Filtrar'),
              onPressed: () {
                if (_animalFilters.filteringFor != null) {
                  _animalFilters.filteringFor.clear();
                  _animalFilters.isFiltering = false;
                }

                if (_color != "Cor") {
                  _animalFilters.filteringFor.add({'color': _color});
                  _animalFilters.isFiltering = true;
                }

                if (_age != "Idade") {
                  _animalFilters.filteringFor.add({'age': _age});
                  _animalFilters.isFiltering = true;
                }

                if (_size != "Tamanho") {
                  _animalFilters.filteringFor.add({'size': _size});
                  _animalFilters.isFiltering = true;
                }

                Redirect.pushUp(context);
                Redirect.pushUp(context);
                Redirect.popUp(context, new AnimalsListPage());
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
