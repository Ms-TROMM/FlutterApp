import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "dart:async";





Future<void> saveLoginState(bool isLoggedIn) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool("isLoggedIn", isLoggedIn);
}

Future<bool?> getLoginState() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool("isLoggedIn");
}
