// ignore_for_file: avoid_print, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meowing/models/user.dart';
import 'package:meowing/services/database.dart';
import 'package:meowing/shared/loading.dart';
import 'package:provider/provider.dart';

class Messager extends StatefulWidget {
  @override
  _MessagerState createState() => _MessagerState();
}

final greyColor = Colors.blueGrey;
final chatBgColor = Color.fromRGBO(246, 187, 0, 1);

class _MessagerState extends State<Messager> {
  @override
  Widget build(BuildContext context) {
    final deviceheight = MediaQuery.of(context).size.height;

    return StreamProvider<List<NewUser>?>.value(
      value: DatabaseService().users,
      initialData: null,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 100,
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.5),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  for (var i = 1; i < 12; i++)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 70,
                        width: 70,
                        child: Icon(Icons.group, size: 20),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Lister(),
                  ),
                ),
              ],
            ),
            height: deviceheight - 237,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
              color: chatBgColor,
            ),
          ),
        ],
      ),
    );
  }
}

class Lister extends StatelessWidget {
  const Lister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (Provider.of<List<NewUser>?>(context) == null) {
      return Loader();
    } else {
      final user = Provider.of<List<NewUser>>(context);
      return Column(
        children: [
          for (var i in user)
            Container(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTap: () {
                },
                child: ListTile(
                  title: Text(i.name.toString(),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600)),
                  subtitle: Text(i.password.toString(),
                      style: TextStyle(color: Colors.black.withOpacity(0.5))),
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/shadypic.jpg'),
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 2,
                      ),
                    ),
                  ),
                  trailing: Icon(
                    Icons.menu_book,
                  ),
                ),
              ),
            ),
        ],
      );
    }
  }
}
