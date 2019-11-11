import 'package:adota_pet/views/details_page.dart';
import 'package:flutter/material.dart';


// Views import
import 'package:adota_pet/views/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adota-Pet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        DetailsPage.routeName: (context) => new DetailsPage(),
        RootPage.routeName: (context) => new RootPage()
      },
      home: RootPage(),
    );
  }
}