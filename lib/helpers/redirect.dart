import 'package:flutter/material.dart';

class Redirect {


  static Future popUp(context, path) {
    return Navigator.of(context).pushNamed(path);
  }
}


// Navigator.of(context).pushNamed(DetailsPage.routeName);