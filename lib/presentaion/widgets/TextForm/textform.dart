import 'package:flutter/material.dart';

class TextInputfield extends StatelessWidget {
  TextInputfield(
      {Key? key,
      required this.hinttext,
      required this.Tcontroller ,
      this.textinputtype = TextInputType.name,
      this.PaddingHorizondal = 12.0,
      this.PaddingVertical = 8.0})
      : super(key: key);

  final String hinttext;
  TextInputType textinputtype;
  final double PaddingHorizondal;
  final double PaddingVertical;
  final TextEditingController Tcontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: PaddingHorizondal, vertical: PaddingVertical),
      child: TextFormField(
        controller: Tcontroller,
        keyboardType: textinputtype,
        decoration: InputDecoration(
          
          isDense: true,
          hintText: hinttext,
          fillColor: Colors.grey[250],
          filled: true,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(),
        ),
      ),
    );
  }
}