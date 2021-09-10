// ignore_for_file: use_key_in_widget_constructors, override_on_non_overriding_member, annotate_overrides, prefer_const_constructors, deprecated_member_use, await_only_futures, avoid_print, prefer_final_fields, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meowing/services/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meowing/services/database.dart';
import 'package:meowing/shared/constraints.dart';
import 'package:meowing/shared/loading.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();

  final String assetName = 'assets/register.svg';
  final Widget svg = SvgPicture.asset(
    'assets/register.svg',
    semanticsLabel: 'Acme Logo',
    fit: BoxFit.contain,
  );

  @override
  AuthService _auth = AuthService();

  String _name = '';
  String _email = '';
  String _error = '';
  String _password = '';
  bool loading = false;

  Widget build(BuildContext context) {
    return loading
        ? Loader()
        : Scaffold(
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(Icons.login),
                          ),
                          Text("Sign In", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                ]),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
              child: Column(
                children: [
                  Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: Text('Register Here!',
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
                            hintText: 'Your Name',
                            prefixIcon: Icon(Icons.fingerprint),
                          ),
                          validator: (val) =>
                              val!.isEmpty ? 'Give Us Your Name!' : null,
                          onChanged: (val) {
                            setState(() => _name = val);
                          },
                        ),
                        gap,
                        TextFormField(
                          // Email
                          decoration: textinputdecoration.copyWith(
                            hintText: 'Email Here',
                            prefixIcon: Icon(Icons.email),
                          ),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter a Email' : null,
                          onChanged: (val) {
                            setState(() => _email = val);
                          },
                        ),
                        gap,
                        TextFormField(
                          // Password
                          decoration: textinputdecoration.copyWith(
                              hintText: 'Password Here',
                              prefixIcon: Icon(Icons.vpn_key)),
                          validator: (val) => val!.length < 6
                              ? 'Add Password more than 6 Chars Long'
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => _password = val);
                          },
                        ),
                        gap,
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 70.0, vertical: 15.0),
                          color: Colors.green,
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              setState(() => loading = true);
                              dynamic _result =
                                  await _auth.registerWithEmailAndPassword(
                                      _name, _email, _password);
                              if (_result == null) {
                                setState(
                                    () => _error = 'Pls Enter a Valid Email ');
                                setState(() => loading = false);
                              }
                            }
                          },
                          child: Text('Register',
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                  letterSpacing: 1,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        if (_error != '')
                          Chip(
                            labelPadding: EdgeInsets.all(10.0),
                            label: Text(
                              "$_error !",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        SizedBox(height: 10),
                        Opacity(
                            opacity: 0.9,
                            child:
                                Container(height: 180, width: 300, child: svg)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
