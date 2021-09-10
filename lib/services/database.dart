// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meowing/models/brew.dart';
import 'package:meowing/models/name.dart';
import 'package:meowing/models/user.dart';

class DatabaseService {
  final String? uid;
  final String? name;

  DatabaseService({
    this.uid,
    this.name,
  });

  final CollectionReference nameCollection =
      FirebaseFirestore.instance.collection('names');

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String name, String sugers, int strength) async {
    return await brewCollection.doc(uid).set({
      'name': name,
      'sugers': sugers,
      'strength': strength,
    });
  }

  Future setUserData(
      String username, String userEmail, String userPassword) async {
    return await nameCollection.doc(username).set({
      'userName': username,
      'userEmail': userEmail,
      'userPassword': userPassword,
    });
  }

  List<NewUser> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return NewUser
      (
        name :  doc.get('userName'),
        email : doc.get('userEmail'),
        password: doc.get('userPassword'),
      );
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.get('name') ?? 'shadeer',
      suger: snapshot.get('sugers') ?? 'no ',
      strength: snapshot.get('strength') ?? 'hello',
    );
  }

  List<Brew> _listFromBrewSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.get('name'),
        sugers: doc.get('sugers'),
        strength: doc.get('strength'),
      );
    }).toList();
  }

  Stream<List<NewUser>> get users {
    return nameCollection.snapshots().map(_userListFromSnapshot);
  }

  Stream<List<Brew>> get brew {
    return brewCollection.snapshots().map(_listFromBrewSnapshot);
  }

  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
