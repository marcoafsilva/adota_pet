import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {

  final String label;
  final controller;
  final bool multiline;
  final double borderRadius;

  const TextInputField({
    @required this.label,
    @required this.controller,
    this.multiline = false,
    this.borderRadius = 50.0
  });

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: (widget.multiline ? TextInputType.multiline : TextInputType.text),
      maxLines: null,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 25.0,
        ),
        labelText: widget.label,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0),
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius)
        )
      ),
      controller: widget.controller,
      autofocus: false,

    );
  }
}
