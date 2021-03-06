// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:meowing/shared/constraints.dart';
import 'package:meowing/models/brew.dart';
import 'package:meowing/screens/home/setting_form.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({required this.brew});

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

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => _showSettingsPanel(),
        child: Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Card(
            borderOnForeground: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.brown[brew.strength!],
                ),
              ),
              title: Text("${brew.name}"),
              subtitle: Text('Takes ${brew.sugers}'),
              trailing: Icon(Icons.favorite),
            ),
          ),
        ),
      ),
    );
  }
}
