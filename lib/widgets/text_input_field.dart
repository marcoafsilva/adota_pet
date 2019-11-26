import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {

  final String label;
  final TextEditingController controller;

  const TextInputField({
    @required this.label,
    @required this.controller
  });

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0),
          ),
          borderRadius: BorderRadius.circular(50.0)
        )
      ),
      controller: widget.controller,
      autofocus: false,
    );
  }
}