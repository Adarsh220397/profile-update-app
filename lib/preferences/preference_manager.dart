import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'preference_constants.dart';

class PreferenceManager {
  //Singleton instance
  PreferenceManager._internal();

  static PreferenceManager instance = PreferenceManager._internal();
  static late SharedPreferences _prefs;

  factory PreferenceManager() {
    return instance;
  }

  Future<void> clearAll() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
  }

  /// ------------------( IS LOGIN )------------------
  // Future<bool> getIsLogin() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   return _prefs.getBool(PreferenceConstants.isLogin) ?? false;
  // }

  // Future<void> setIsLogin(bool isLogin) async {
  //   _prefs = await SharedPreferences.getInstance();
  //   _prefs.setBool(PreferenceConstants.isLogin, isLogin);
  // }

  /// ------------------( IS BASIC USER DATA FILLED )------------------
  // Future<bool> getBasicUserDataFilled() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   return _prefs.getBool(PreferenceConstants.isBasicUserDataFilled) ?? false;
  // }

  // Future<void> setBasicUserDataFilled(bool isBasicUserDataFilled) async {
  //   _prefs = await SharedPreferences.getInstance();
  //   _prefs.setBool(
  //       PreferenceConstants.isBasicUserDataFilled, isBasicUserDataFilled);
  // }

  /// ------------------( USER ID )------------------
  Future<String> getUserId() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(PreferenceConstants.userId) ?? "";
  }

  Future<void> setUserId(String userId) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString(PreferenceConstants.userId, userId);
  }

  /// ------------------( MOBILE NUMBER )------------------
  Future<String> getMobileNumber() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(PreferenceConstants.mobileNumber) ?? "";
  }

  Future<void> setMobileNumber(String mobileNumber) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString(PreferenceConstants.mobileNumber, mobileNumber);
  }

  /// ------------------( NAME )------------------
  Future<String> getName() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(PreferenceConstants.name) ?? "";
  }

  Future<void> setName(String name) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString(PreferenceConstants.name, name);
  }

  /// ------------------( EMAIL )------------------
  Future<String> getEmail() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(PreferenceConstants.email) ?? "";
  }

  Future<void> setEmail(String email) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString(PreferenceConstants.email, email);
  }

  /// ------------------( ADDRESS )------------------
  Future<String> getAddress() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(PreferenceConstants.address) ?? "";
  }

  Future<void> setAddress(String address) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString(PreferenceConstants.address, address);
  }

  /// ------------------( IMAGE )------------------
  Future<String> getImageUrl() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(PreferenceConstants.image) ?? "";
  }

  Future<void> setImage(String image) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString(PreferenceConstants.image, image);
  }
}
