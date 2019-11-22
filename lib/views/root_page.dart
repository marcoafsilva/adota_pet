import 'package:adota_pet/helpers/redirect.dart';
import 'package:adota_pet/views/animals_list_page.dart';
import 'package:adota_pet/views/details_page.dart';
import 'package:adota_pet/widgets/boxed_container.dart';
import 'package:adota_pet/widgets/card_scroll.dart';
import 'package:adota_pet/widgets/carousel_item.dart';
import 'package:adota_pet/widgets/custom_drawer.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:flutter/material.dart';
import 'package:screen/screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:adota_pet/helpers/animals_data_example.dart';


class RootPage extends StatefulWidget {

  static const String routeName = '/root';

  @override
  _RootPageState createState() => _RootPageState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

var currentPage = animalsCarouselList.length - 1.0;
PageController controller = PageController(initialPage: animalsCarouselList.length - 1);


class _RootPageState extends State<RootPage> {

  @override
  Widget build(BuildContext context) {

    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });    

    Screen.keepOn(true);

    var widgetsList = <Widget> [
      _trending(),
      _trendingMoreInfo(),
      _trendingCards()
    ];
    
    return DefaultPage(
      elements: widgetsList,
    );
  }
  
  Widget _trending() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Recentes",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              letterSpacing: 1.0,
              fontWeight: FontWeight.bold
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              size: 34.0,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _trendingMoreInfo() {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFff6e6e),
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 22.0,
                  vertical: 6.0
                ),
                child: Text(
                  'Mogi-Guaçu',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(width: 15.0),
          Text(
            "10+ Cidades",
            style: TextStyle(color: Colors.blueAccent),
          )
        ],
      ),
    );
  }

  Widget _trendingCards() {
    return Stack(
      children: <Widget>[
        CardScrollWidget(currentPage),
        Positioned.fill(
          child: PageView.builder(
            itemCount: 3,
            controller: controller,
            reverse: true,
            itemBuilder: (context, index) {
              return Container();
            },
          ),
        )
      ],
    );
  }

}





