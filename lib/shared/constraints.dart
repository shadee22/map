// ignore_for_file: unused_element, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/simple_animations.dart';

const textinputdecoration = InputDecoration(
  hintText: 'Email Here',
  prefixIcon: Icon(Icons.supervised_user_circle),
  fillColor: Color(0xffFBE499),
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

const gap = SizedBox(height: 20);

const appbarcolor = Color.fromARGB(240, 254, 194, 96);
const brewCrewBgColor = Color.fromARGB(255, 44, 46, 67);
// const messagerBgColor = Color.fromRGBO(247, 223, 166, 1);
const messagerBgColor = Colors.blueGrey;
const onwerBgColor = Color.fromRGBO(229, 80, 57, 1.0);
const yellowBack = Color.fromRGBO(255, 177, 66, 1.0);
const purple = Color.fromRGBO(110, 77, 239, 1.0);
const teal = Color.fromRGBO(77, 206, 239, 1.0);
const greeny = Color.fromRGBO(102, 179, 211, 1.0);
const white = Colors.white;

var glory_font = GoogleFonts.archivo(
  textStyle: TextStyle(fontWeight: FontWeight.w600),
);

var tekoMyName = GoogleFonts.teko(
  textStyle: TextStyle(
      fontWeight: FontWeight.w600, fontSize: 40.0, color: Colors.white),
);

var pacificofont = GoogleFonts.pacifico(
  textStyle: TextStyle(
      fontWeight: FontWeight.w400, fontSize: 40.0, color: Colors.white),
);

var ralewayfont = GoogleFonts.raleway(
  textStyle: TextStyle(
      fontWeight: FontWeight.w400, fontSize: 30.0, color: Colors.white),
);

//Snackbar
// var snack = SnackBar(content: Text('this is the snackcbar'));
// ScaffoldMessenger.of(context).showSnackBar(snack);

//Animations

Widget animationShower(error) {
  return PlayAnimation<double?>(
    tween: Tween(begin: 0.0, end: 100.0),
    duration: Duration(milliseconds: 1000),
    builder: (context, child, value) {
      return Container(
          color: Colors.blue, // use animated value
          width: value,
          height: value,
          child: child);
    },
    child: Text('$error !')
  );
}


// OpenContainer(
//                     closedShape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(0)),
//                     ),
//                     closedBuilder: (context, closedContainer) {
//                       return Material(
//                           child: Center(
//                               child: Container(
//                         child: Text("shadeer is theb aste"),
//                       )));
//                     },
//                     openBuilder: (context, closedContainer) {
//                       return Scaffold(
//                           floatingActionButton:
//                               FloatingActionButton.large(onPressed: () {}),
//                           appBar: AppBar(
//                             title: Text('shadeer'),
//                           ),
//                           body: Center(
//                               child: Container(
//                             height: 200,
//                             width: 200,
//                             color: teal,
//                           )));
//                     },
//                   ),



//Navigator 

// Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => NewList(),
//                           ),
//                         ),