import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {

  final List<Widget> elements;

  const DefaultPage({
    this.elements
  });

  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {

  final widgetsList = List<Widget>();

  @override
  Widget build(BuildContext context) {
    
    widgetsList.clear();
    _populate();

    return _mainBody();
  }


  Widget _mainBody() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1b1e44),
            Color(0xFF2d3447),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          tileMode: TileMode.clamp
        )
      ),
      child: _body(),
    );
  }


  Widget _body() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: widgetsList
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 30.0,
        bottom: 8.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _menuTopBtn(),
          _searchtopBtn(),
        ],
      ),
    );
  }

  Widget _menuTopBtn() {
    return IconButton(
      icon: Icon(
        Icons.menu,
        color: Colors.white,
        size: 30.0,
      ),
      onPressed: () {},
    );
  }

  Widget _searchtopBtn() {
    return IconButton(
      icon: Icon(
        Icons.search,
        color: Colors.white,
        size: 30.0,
      ),
      onPressed: () {},
    );
  }

  void _populate() {
    widgetsList.add(_header());

    for (var i = 0; i < widget.elements.length; i++) {
      widgetsList.add(widget.elements[i]);
    }

  }

}