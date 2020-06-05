import 'package:adota_pet/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:screen/screen.dart';

class DefaultScaffold {

  static Widget view (String title, Widget body, [drawer = true]) {
    Screen.keepOn(true);
    return Scaffold(
      appBar: _buildAppBar(title),
      body: body,
      backgroundColor: Color.fromRGBO(255, 255, 255, .9),
      drawer: drawer ? CustomDrawer() : null,
    );
  }

  // App Bar builder
  static Widget _buildAppBar(title) {
    return AppBar(
      title: Text(title),
    );
  }
}
