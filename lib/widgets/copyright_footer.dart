import 'package:flutter/material.dart';

class CopyrightFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Opacity(
        opacity: 0.1,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 30.0, 0, 15.0),
          child: Text(
            'Adota Pet',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
