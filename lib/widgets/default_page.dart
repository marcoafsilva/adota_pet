import 'package:adota_pet/widgets/custom_drawer.dart';
import 'package:adota_pet/widgets/filter_drawer.dart';
import 'package:flutter/material.dart';
import 'package:screen/screen.dart';
import 'package:adota_pet/helpers/redirect.dart';


class DefaultPage extends StatefulWidget {

  final List<Widget> elements;
  final bool back;
  final bool search;
  final String title;

  const DefaultPage({
    this.elements,
    this.back,
    this.search = false,
    this.title
  });

  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final widgetsList = List<Widget>();

  @override
  Widget build(BuildContext context) {

    Screen.keepOn(true);

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
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: widgetsList
        ),
      ),
      drawer: CustomDrawer(),
      endDrawer: FilterDrawer(),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 40.0,
        bottom: 8.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _menuTopBtn(),
          (widget.search ? _filterBtn() : Text('')),
        ],
      ),
    );
  }

  Widget _menuTopBtn() {
    return IconButton(
      icon: Icon(
        ((widget.back == null ? Icons.menu : Icons.arrow_back)),
        color: Colors.white,
        size: 30.0,
      ),
      onPressed: () {
        if (widget.back == null) {
          _scaffoldKey.currentState.openDrawer();
        } else {
          Redirect.pushUp(context);
        }
      },
    );
  }

  Widget _filterBtn() {
    return IconButton(
      icon: Icon(
        Icons.sort,
        color: Colors.white,
        size: 30.0,
      ),
      onPressed: () {
        _scaffoldKey.currentState.openEndDrawer();
      },
    );
  }

  Widget _pageTitle() {

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: (widget.title != null ? 10.0 : 0.0)),
      ],
    );
  }

  void _populate() {
    widgetsList.add(_header());
    widgetsList.add((widget.title != null) ? _pageTitle() : SizedBox());

    if (widget.elements != null) {
      for (var i = 0; i < widget.elements.length; i++) {
        widgetsList.add(widget.elements[i]);
      }
    }

  }

}
