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

var _currentPage = animalsCarouselList.length - 1.0;
PageController _controller = PageController(initialPage: animalsCarouselList.length - 1);

var _currentPage2 = animalsCarouselList.length - 1.0;
PageController _controller2 = PageController(initialPage: animalsCarouselList.length - 1);


class _RootPageState extends State<RootPage> {

  @override
  Widget build(BuildContext context) {

    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page;
      });
    });    

    _controller2.addListener(() {
      setState(() {
        _currentPage2 = _controller2.page;
      });
    });    


    var widgetsList = <Widget> [
      // Trending items
      _trending(),
      _trendingMoreInfo(),
      _trendingCards(
        controller: _controller,
        currentPage: _currentPage
      ),

      SizedBox(height: 40.0),

      // Favorite items
      _trending(
        title: 'Favoritos',
        icon: Icons.favorite
      ),
      _trendingCards(
        controller: _controller2,
        currentPage: _currentPage2
      ),
    ];
    
    return DefaultPage(
      elements: widgetsList,
    );
  }
  
  Widget _trending({String title, icon}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon ?? Icons.timer, 
                size: 30.0, 
                color: Colors.white,
              ),
              SizedBox(width: 5.0,),
              Text(
                title ?? "Recentes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
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

  Widget _trendingMoreInfo({String cityName, bool hideMoreCities = false }) {
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
                  horizontal: 15.0,
                  vertical: 6.0
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.place,
                      size: 18.0,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      cityName ?? 'Mogi-Guaçu',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 15.0),
          hideMoreCities ? SizedBox(height: 0.0,) : Text(
            "10+ Cidades",
            style: TextStyle(color: Colors.blueAccent),
          )
        ],
      ),
    );
  }

  Widget _trendingCards({controller, currentPage}) {
    return new Stack(
      children: <Widget>[
        new CardScrollWidget(currentPage),
        new Positioned.fill(
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





