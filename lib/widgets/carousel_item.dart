import 'package:flutter/material.dart';

class CarouselItem extends StatefulWidget {
  final String title;
  final img;
  final age;
  final city;
  final state;

  const CarouselItem({
    this.title,
    this.img,
    this.age,
    this.city,
    this.state
  });

  @override
  _CarouselItemState createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
        border: Border.all(
          color: Color.fromRGBO(0, 0, 0, .1)
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Container(
            height: 130.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9.0),
                topRight: Radius.circular(9.0)
              ),
              image: DecorationImage(
                image: NetworkImage(widget.img),
                fit: BoxFit.cover
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0
                  ),
                ),
                Text(
                  widget.city + " - " + widget.state,
                  style: TextStyle(
                    color: Colors.grey
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}