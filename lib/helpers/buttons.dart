import 'package:flutter/material.dart';

class ButtonsHelper {
  
  static FlatButton roundedBtn({label, action, icon, fontSize}) {
    return FlatButton(
      onPressed: () =>action,
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
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
    );
  }
}
