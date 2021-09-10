class MyUser {
  final String uid;
  MyUser({required this.uid});
}

class NewUser {
  final String? name;
  final String? email;
  final String? password;

  NewUser({this.name, this.email, this.password});
}

class UserData {
  String? uid;
  String? name;
  String? suger;
  int? strength;

  UserData({this.uid, this.name, this.suger, this.strength});
}
