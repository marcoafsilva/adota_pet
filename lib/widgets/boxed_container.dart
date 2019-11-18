import 'package:flutter/material.dart';

class BoxedContainer extends StatefulWidget {
  final String title;
  final content;
  final btnAction;
  final btnText;

  const BoxedContainer({
    this.title,
    this.content,
    this.btnAction,
    this.btnText
  });

  @override
  _BoxedContainerState createState() => _BoxedContainerState();
}

class _BoxedContainerState extends State<BoxedContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration(),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: <Widget>[
            // Title
            Text(
              widget.title ?? '',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            widget.content ?? Text(''),
            widget.btnAction != null ? RaisedButton(
              color: Colors.blue,
              child: Text(widget.btnText ?? 'Ver Todos'),
              textColor: Colors.white,
              onPressed: () {
                widget.btnAction();
              },
            ) : Text('')
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, .3),
          offset: Offset(0.0, 5.0),
          blurRadius: 10.0
        )
      ]
    );
  }
}