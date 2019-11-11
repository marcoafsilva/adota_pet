import 'package:flutter/material.dart';

class Redirect {

  static void popUp(context, screen){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
}
