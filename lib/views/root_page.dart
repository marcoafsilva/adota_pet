import 'package:adota_pet/helpers/redirect.dart';
import 'package:adota_pet/views/details_page.dart';
import 'package:adota_pet/widgets/boxed_container.dart';
import 'package:adota_pet/widgets/carousel_item.dart';
import 'package:adota_pet/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:screen/screen.dart';
import 'package:carousel_slider/carousel_slider.dart';


class RootPage extends StatefulWidget {

  static const String routeName = '/root';

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    Screen.keepOn(true);
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: CustomDrawer(),
      body: _buildBody(),
      backgroundColor: Color.fromRGBO(255, 255, 255, .9),
    );
  }

  /**
   * App Bar builder
   */
  Widget _buildAppBar() {
    return AppBar(
      title: Text('Adota-pet'),
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
          _showUserWelcome(),
          Divider(
            color: Color.fromRGBO(255, 255, 255, 0),
          ),
          _showAnimalsCarousel(),
        ],
      ),
    );
  }

  /**
   * Welcome message
   */
  Widget _showUserWelcome() {
    String _userName = "Marco Silva";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Olá,',
          style: TextStyle(
            fontSize: 16.0
          ),
        ),
        Text(
          '$_userName!',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }

  /**
   * Animals carousel
   */
  Widget _showAnimalsCarousel() {
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      
      children: <Widget>[
        BoxedContainer(
          title: 'Animais:', 
          content: _getAnimals(),
          btnAction: () => Redirect.popUp(context, DetailsPage.routeName),
        ),
      ],
    );
  }

  CarouselSlider _getAnimals() {
    var teste = [
      {
        'title' : 'Pitoco',
        'img'   : 'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png',
        'age'   : '5',
        'city'  : 'Mogi Guaçu',
        'state' : 'SP'
      },
      {
        'title' : 'Estopinha',
        'img'   : 'http://haloanimalshelter.co.za/wp-content/uploads/2017/10/Cute-Dog-Photography.jpg',
        'age'   : '5',
        'city'  : 'Mogi Mirim',
        'state' : 'SP'
      }
    ];

    return CarouselSlider(
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 4),
      // enlargeCenterPage: true,
      height: 180.0,
      items: teste.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              child: CarouselItem(
                title: i['title'],
                img: i['img'],
                age: i['age'],
                city: i['city'],
                state: i['state']
              ),
              onTap: () {
                Redirect.popUp(context, DetailsPage.routeName);
              },
            );
          },
        );
      }).toList(),
    );
  }
}





