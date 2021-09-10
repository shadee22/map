// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:meowing/shared/constraints.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Chips {
  String? name;
  Color? color;
  Chips({this.name, this.color});
}

class Owner extends StatefulWidget {
  @override
  OwnerState createState() => OwnerState();
}

class OwnerState extends State<Owner> with TickerProviderStateMixin {
  List<dynamic> chips = [
    Chips(name: 'Flutter', color: Colors.blueAccent),
    Chips(name: "Python", color: Colors.yellowAccent),
    Chips(name: "Django", color: Colors.greenAccent),
    Chips(name: "Php", color: Colors.purpleAccent),
    Chips(name: "Node Js", color: Colors.lightGreenAccent),
    Chips(name: "MySql", color: Colors.white),
    Chips(name: "Javascript", color: Colors.yellowAccent),
    Chips(name: "Css", color: Colors.lime),
    Chips(name: "Firebase", color: Colors.orangeAccent),
  ];
  void showDialog(logo) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 100),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 350,
            width: 350,
            child: Icon(logo, size: 70),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  double sideLength = 50;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          //Photo Container
          Container(
            child: Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'I AM',
                        style: tekoMyName,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'SHADEER',
                        textAlign: TextAlign.center,
                        style: tekoMyName,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(142, 184, 139, 0.6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              splashColor: Colors.red,
                              onPressed: () {
                                showDialog(FontAwesomeIcons.instagram);
                              },
                              icon: Icon(FontAwesomeIcons.instagram,
                                  color: Colors.red),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(FontAwesomeIcons.linkedinIn);
                              },
                              icon: Icon(FontAwesomeIcons.linkedinIn,
                                  color: Colors.blue),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(FontAwesomeIcons.facebook);
                              },
                              icon: Icon(FontAwesomeIcons.facebook),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //photo
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(0.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/shadypic.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
            ]),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.green,
                  Colors.blue,
                ],
              ),
            ),
            height: 230,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(height: 15),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DefaultTextStyle(
                  style: pacificofont,
                  child: AnimatedTextKit(
                    stopPauseOnTap: true,
                    animatedTexts: [
                      TyperAnimatedText('Hola !',
                          speed: Duration(milliseconds: 300)),
                      TyperAnimatedText('Hello !',
                          speed: Duration(milliseconds: 300)),
                      TyperAnimatedText('Salaam !',
                          speed: Duration(milliseconds: 300)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('"The Clever Person Who Loves to Solve Problems"',
                      style: ralewayfont),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'The Guy in the picture Walked trough',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 8.0),
                  child: Wrap(
                      spacing: 7.0,
                      alignment: WrapAlignment.center,
                      children: [
                        for (var i in chips)
                          Chip(
                            shape: StadiumBorder(
                                side: BorderSide(color: Colors.grey)),
                            backgroundColor: Colors.black.withOpacity(0.7),
                            label: Text(
                              i.name,
                              style: ralewayfont.copyWith(
                                  fontSize: 15.0,
                                  color: i.color,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                      ]),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[
                  purple,
                  teal,
                ],
              ),
            ),
            height: 400,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
