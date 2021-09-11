// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, non_constant_identifier_names, unused_field, await_only_futures, prefer_const_literals_to_create_immutables, unused_element, unused_local_variable, void_checks

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meowing/services/auth.dart';
import 'package:meowing/shared/constraints.dart';
import 'package:meowing/shared/loading.dart';
// import 'package:simple_animations/simple_animations.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

// import 'package:animations/animations.dart';
// import 'package:meowing/screens/authentication/register.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

enum AniProps { width, height, color }

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final String assetName = 'assets/loggg.svg';
  final Widget svg = SvgPicture.asset(
    'assets/loggg.svg',
    semanticsLabel: 'Acme Logo',
    fit: BoxFit.contain,
  );

  final _signinformkey = GlobalKey<FormState>();

  bool loading = false;
  String _email = '';
  String _password = '';
  String _error = '';

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Loader();
    } else {
      return Scaffold(
        extendBody: true,
        backgroundColor: Color.fromRGBO(255, 177, 66, 1.0),
        appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 60,
            title: Text(
              'HappyTone',
              style: GoogleFonts.teko(
                textStyle: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            backgroundColor: appbarcolor,
            actions: [
              Container(
                margin: EdgeInsets.all(7.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: Color.fromRGBO(249, 202, 36, 1.0),
                    ),
                  ),
                  onPressed: () => widget.toggleView(),
                  padding: EdgeInsets.all(10.0),
                  color: Color.fromRGBO(240, 147, 43, 1.0),
                  textColor: Colors.white,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Icon(Icons.app_registration),
                      ),
                      Text("Register", style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
              ),
            ]),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
            child: Form(
              key: _signinformkey,
              child: Column(
                children: <Widget>[
                  if (_error != '')
                    FadeIn(
                      duration: Duration(milliseconds: 1000),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.no_cell, color: white),
                                Text(
                                  "$_error ! ",
                                  style: ralewayfont.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => {
                                    setState(() {
                                      _error = '';
                                    })
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(7.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'I have Account',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => widget.toggleView(),
                                  child: Container(
                                    padding: EdgeInsets.all(9.0),
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.yellowAccent.withOpacity(0.5),
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                      ),
                    ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Sign in!',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.robotoCondensed(
                        textStyle: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    // Email
                    decoration: textinputdecoration.copyWith(
                        hintText: 'Email Here', prefixIcon: Icon(Icons.email)),
                    validator: (val) =>
                        val!.isEmpty ? 'Enter a Valid Password' : null,
                    onChanged: (val) {
                      setState(() => _email = val);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // Password
                    decoration: textinputdecoration.copyWith(
                        hintText: 'Password Here',
                        prefixIcon: Icon(Icons.vpn_key)),
                    validator: (val) => val!.length < 6
                        ? 'Enter a password More than 6 Charecters'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => _password = val);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
                    color: Colors.green,
                    onPressed: () async {
                      setState(() => loading = true);
                      if (_signinformkey.currentState!.validate()) {
                        dynamic _result = await _auth
                            .signInWithEmailAndPassword(_email, _password);
                        if (_result == null) {
                          setState(() => _error = 'Please Register First');
                          setState(() => loading = false);
                        }
                      }
                    },
                    child: Text('Sign in',
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Text(
                    _error,
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  Opacity(
                      opacity: 0.9,
                      child: SizedBox(height: 170, width: 200, child: svg)),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}

class NewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: true,
      ),
      body: Container(height: 100, width: double.infinity, color: Colors.red),
    );
  }
}
