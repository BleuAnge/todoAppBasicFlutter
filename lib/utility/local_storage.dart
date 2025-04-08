// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _preferences;

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  CreateList({
    required List<String> data
  }) async {
    await _preferences.setStringList('TODO_LIST', data);
  }

  static List<String> GetList() {
    return _preferences.getStringList('TODO_LIST') ?? [];
  }

  AddToList({
    required String data
  }) async {
    List<String> list = _preferences.getStringList('TODO_LIST') ?? [];
    list.add(data);
    await _preferences.setStringList('TODO_LIST', list);
  }

  UpdateFromList({
    required String data,
    required int id
  }) async {
    List<String> list = _preferences.getStringList('TODO_LIST') ?? [];

    list.removeWhere(
      (todo) {
        return jsonDecode(
          todo
        )["id"] == id;
      }
    );

    list.add(data);

    await _preferences.setStringList('TODO_LIST', list);
  }

  RemoveFromList({
    required int id
  }) async {
    List<String> list = _preferences.getStringList('TODO_LIST') ?? [];

    list.removeWhere(
      (todo) {
        return jsonDecode(
          todo
        )["id"] == id;
      }
    );

    await _preferences.setStringList('TODO_LIST', list);
  }

  ClearList() async {
    await _preferences.setStringList('TODO_LIST', []);
  }
}