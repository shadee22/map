// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, unused_import, prefer_final_fields
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meowing/screens/home/owner.dart';
import 'package:meowing/screens/home/setting_form.dart';
import 'package:meowing/services/auth.dart';
import 'package:meowing/services/database.dart';
import 'package:provider/provider.dart';
import 'package:meowing/screens/home/brew_list.dart';
import 'package:meowing/models/brew.dart';
import 'package:meowing/models/name.dart';
import 'package:meowing/models/user.dart';
import 'package:meowing/screens/home/messager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'package:meowing/shared/constraints.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int _currentIndex = 1;
  int _currentColor = 1;

  final List<Widget> _children = [BrewList(), Messager(), Owner()];
  final List<Color> _colors = [
    brewCrewBgColor,
    messagerBgColor,
    onwerBgColor
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void colorChanger(int index) {
    setState(() {
      _currentColor = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SettingsForm(),
          );
        },
      );
    }

    // final user = Provider.of<MyUser>(context);
    return StreamProvider<List<Brew>?>.value(
      value: DatabaseService().brew,
      initialData: null,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            title: Text(
              'HappyTone',
              style: GoogleFonts.teko(
                textStyle: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            backgroundColor: appbarcolor,
            // backgroundColor: Color.fromRGBO(179, 63, 64 , 1.0),
            // elevation: 0.0,
            actions: [
              FlatButton.icon(
                icon: Icon(
                  Icons.stop_screen_share,
                  color: Color.fromRGBO(83, 92, 104, 1.0),
                ),
                label: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Color.fromRGBO(83, 92, 104, 1.0),
                  ),
                ),
                onPressed: () async {
                  await _auth.SignOut();
                },
              ),
              // Container(
              //   margin: EdgeInsets.all(7.0),
              //   child: RaisedButton(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(18.0),
              //       side: BorderSide(
              //         color: Color.fromRGBO(249, 202, 36, 1.0),
              //       ),
              //     ),
              //     onPressed: () => _showSettingsPanel(),
              //     padding: EdgeInsets.all(10.0),
              //     color: Color.fromRGBO(240, 147, 43, 1.0),
              //     textColor: Colors.white,
              //     child: Row(
              //       children: [
              //         Icon(Icons.settings),
              //         Text("Settings", style: TextStyle(fontSize: 15)),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
          bottomNavigationBar: TitledBottomNavigationBar(
            curve: Curves.bounceOut,
            height : MediaQuery.of(context).size.height / 12,
            enableShadow: true,
            activeColor: Colors.blueGrey,
            inactiveColor: Colors.white,
            inactiveStripColor:Color.fromARGB(240, 254, 194, 96) ,
            currentIndex:
                _currentIndex, // Use this to update the Bar giving a position
            onTap: (value) {
              onTabTapped(value);
              colorChanger(value);
            },
            items: [
              TitledNavigationBarItem(
                  backgroundColor: Color.fromARGB(240, 254, 194, 96),
                  title: Text(  
                    'Brew Crew',
                    style: glory_font,
                  ),
                  icon: Icon(Icons.airline_seat_individual_suite_rounded)),
              TitledNavigationBarItem(
                  backgroundColor: Color.fromARGB(240, 254, 194, 96),
                  title: Text('Messages', style: glory_font),
                  icon: Icon(Icons.message_rounded)),
              TitledNavigationBarItem(
                  backgroundColor: Color.fromARGB(240, 254, 194, 96),
                  title: Text('Owner', style: glory_font),
                  icon: Icon(Icons.military_tech)),
            ],
          ),

          backgroundColor: _colors[_currentColor],
          body: _children[_currentIndex], // returns a body (Brew List);
        ),
      ),
    );
  }
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('First tab', style: TextStyle(fontSize: 20.0)));
  }
}

// class Second extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         height: 50,
//         width: 320,
//         child: adWidget,
//       ),
//     );
//   }
// }

// class Third extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Third tab', style: TextStyle(fontSize: 20.0)));
//   }
// }

// class Fourth extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('4 tab', style: TextStyle(fontSize: 20.0)));
//   }
// }
