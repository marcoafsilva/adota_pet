import 'package:flutter/material.dart';

class ButtonsHelper {
  
  static FlatButton roundedBtn({label, action, icon, fontSize, size}) {

    var _horizontalPadding = 10.0;
    var _verticalPadding = 20.0;

    switch (size) {
      case 'sm':
        _horizontalPadding = 5.0;
        _verticalPadding = 0.0;
        break;

      case 'md':
        _horizontalPadding = 10.0;
        _verticalPadding = 10.0;
        break;
    }

    return FlatButton(
      onPressed: () =>action,
      color: Color(0xFF1b1e44),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _horizontalPadding,
          vertical: _verticalPadding
        ),
        child: Row(
          children: <Widget>[
            icon != null ? Icon(icon, color: Colors.white) : SizedBox(),
            SizedBox(width: (icon != null ? 5.0 : 0.0)),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: (fontSize ?? 15.0)
              ),
            ),
          ],
        ),
      )
    );
  }
}
