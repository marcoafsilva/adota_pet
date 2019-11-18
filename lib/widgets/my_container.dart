import 'package:flutter/material.dart';

class MyContainer extends StatefulWidget {

  final Widget body;

  const MyContainer({
    this.body
  });

  @override
  _MyContainerState createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          widget.body
        ],
      ),
    );
  }
}