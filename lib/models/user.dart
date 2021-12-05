import 'dart:core';

class User {
  final int id;
  late String username;
  late String email;
  late String password;
  late int sex;
  late int birthYear;
  late bool push;

  // view
  bool isAuthenticated = false;
  bool isFirstVisit = true;

  User(this.id);
}

User lgUser = User(0);