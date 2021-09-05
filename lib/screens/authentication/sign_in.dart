// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, non_constant_identifier_names, unused_field, await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meowing/services/auth.dart';
import 'package:meowing/shared/constraints.dart';
import 'package:meowing/shared/loading.dart';
import 'package:meowing/shared/constraints.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

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
    return loading
        ? Loader()
        : Scaffold(
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
                      // letterSpacing: 1,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                backgroundColor: appbarcolor,
                // elevation: 0.0,
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
                          Icon(Icons.settings),
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
                      SizedBox(
                        width: double.infinity,
                        child: Text('Sign in!',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.robotoCondensed(
                              textStyle: TextStyle(
                                fontSize: 45.0,
                                fontWeight: FontWeight.w800,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        // Email
                        decoration: textinputdecoration.copyWith(
                            hintText: 'Email Here',
                            prefixIcon: Icon(Icons.email)),
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
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 70.0, vertical: 15.0),
                        color: Colors.red,
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
                      SizedBox(height: 20),
                      Text(
                        _error,
                        style: TextStyle(color: Colors.red, fontSize: 20.0),
                      ),
                      SizedBox(height: 20),
                      Opacity(
                          opacity: 0.9,
                          child:
                              Container(height: 170, width: 200, child: svg)),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
