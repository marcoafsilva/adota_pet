import 'package:adota_pet/helpers/animals_data_example.dart';
import 'package:adota_pet/helpers/redirect.dart';
import 'package:adota_pet/views/details_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class CardScrollWidget extends StatelessWidget {

  var currentPage;
  var padding = 5.0;
  var verticalInset = 20.0;

  // Constructor
  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, contraints) {
          var width = contraints.maxWidth;
          var height = contraints.maxHeight;

          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizonInset = primaryCardLeft / 2;

          List<Widget> cardList = new List();

          for (var i = 0; i < animalsCarouselList.length; i++) {
            var delta = i - currentPage;
            bool isOnRight = delta > 0;

            var start = padding + max(
              primaryCardLeft - horizonInset * -delta * (isOnRight ? 15 : 1),
              0.0
            );
            
            var cardItem = Positioned.directional(
              top: padding + verticalInset + max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: _cardBody(context, animalsCarouselList[i]),
            );
            
            cardList.add(cardItem);
          }
          
          return Stack(
            children: cardList,
            overflow: Overflow.clip,
          );
        },
      ),
    );
  }

  Widget _cardBody(context, el) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(3.0, 6.0),
              blurRadius: 10.0
            )
          ]
        ),
        child: AspectRatio(
          aspectRatio: cardAspectRatio,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.network(el.img, fit: BoxFit.cover),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0
                      ),
                      child: Text(
                        el.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12.0,
                        bottom: 12.0
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 22.0,
                          vertical: 6.0
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          '+ Informações',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300
                            ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _cardAction(context, el) {
    Redirect.popUp(context, new DetailsPage(animal: el));
  }
}