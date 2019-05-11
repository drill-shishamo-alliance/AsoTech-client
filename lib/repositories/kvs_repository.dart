import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class KVSRepository {
  // Create Singleton Object
  static KVSRepository _instance;
  SharedPreferences client;
  factory KVSRepository() {
    if (_instance == null) _instance = new KVSRepository._internal();
    return _instance;
  }

  Future<bool> initTokenIsExist() async {
    final SharedPreferences client = await SharedPreferences.getInstance();
    return await client.setBool("HAS_TOKEN", false);
  }

  Future<String> getUserId() async {
    final SharedPreferences client = await SharedPreferences.getInstance();
    return client.getString("USER_ID");
  }

  Future<bool> setUserId(String userId) async {
    final SharedPreferences client = await SharedPreferences.getInstance();
    final result = await client.setString("ROOM_ID", userId);
    return result;
  }

  Future<String> getRoomId() async {
    final SharedPreferences client = await SharedPreferences.getInstance();
    return client.getString("USER_ID");
  }

  Future<bool> setRoomId(String userId) async {
    final SharedPreferences client = await SharedPreferences.getInstance();
    final result = await client.setString("ROOM_ID", userId);
    return result;
  }
  KVSRepository._internal();
}