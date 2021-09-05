// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const textinputdecoration = InputDecoration(
  hintText: 'Email Here',
  prefixIcon: Icon(Icons.supervised_user_circle),
  fillColor: Colors.orangeAccent,
  focusColor: Colors.green,
  hoverColor: Colors.green,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.brown, width: 2.0)),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.red, width: 2.0)),
);

const appbarcolor = Color.fromARGB(240, 254, 194, 96);
const brewCrewBgColor = Color.fromARGB(255, 44, 46, 67);
const messagerBgColor = Color.fromRGBO(184, 233, 148, 1.0);
const onwerBgColor = Color.fromRGBO(229, 80, 57, 1.0);

const yellowBack = Color.fromRGBO(255, 177, 66, 1.0);

var glory_font = GoogleFonts.archivo(
  textStyle: TextStyle(fontWeight: FontWeight.w600),
);
