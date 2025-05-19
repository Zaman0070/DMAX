import 'dart:convert';

import 'package:dmax_app/model/message_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefAPis {
  Future<void> saveToneList(String key, List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }

  // get String list
  Future<List<String>> getStringList(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  // remove String list
  Future<void> removeStringList(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  // save dynamic List
  Future<void> saveDynamicList(String key, MessageModel newMessage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> existingList = prefs.getStringList(key) ?? [];
    String jsonString = jsonEncode(newMessage.toJson());
    existingList.add(jsonString);

    await prefs.setStringList(key, existingList);
  }

  // get dynamic List
  Future<List<MessageModel>> getDynamicList(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? stringList = prefs.getStringList(key);

    if (stringList == null) return [];
    return stringList
        .map((jsonStr) => MessageModel.fromJson(jsonDecode(jsonStr)))
        .toList();
  }
}
