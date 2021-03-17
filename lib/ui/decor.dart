import 'package:flutter/material.dart';

//input box decorations
InputDecoration buildInputDecoration(
  IconData icons,
  String hinttext,
) {
  return InputDecoration(
    fillColor: Colors.white,
    counterStyle: TextStyle(color: Color.fromARGB(255, 105, 11, 184)),
    helperStyle: TextStyle(
      color: Color.fromARGB(255, 133, 0, 144),
    ),
    labelStyle: TextStyle(
      color: Color.fromARGB(255, 133, 80, 244),
    ),
    hintText: hinttext,
    hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
    prefixIcon: Container(
      padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: Icon(
        icons,
        color: Color.fromARGB(255, 252, 33, 183),
        size: 30,
      ),
    ),
    errorStyle: TextStyle(
      color: Color.fromARGB(255, 250, 77, 144),
      fontWeight: FontWeight.w900,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide:
          BorderSide(color: Color.fromARGB(255, 210, 65, 243), width: 2.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 247, 162, 23),
        width: 2.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 255, 220, 122),
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 73, 49, 215),
        width: 2.0,
      ),
    ),
  );
}
