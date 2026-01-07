import 'dart:convert';
import 'dart:io';

import '../models/user.dart';

class UserStorage {
  final String filePath = 'users.json';

  // save a single user to JSON file
  Future<void> saveUser(User user) async {
    List<User> users = await getUsers();
    users.add(user);

    final file = File(filePath);

    List<Map<String, dynamic>> jsonList = users
        .map((user) => user.toJson())
        .toList();

    await file.writeAsString(jsonEncode(jsonList));
  }

  // Read all users from JSON file
  Future<List<User>> getUsers() async {
    final file = File(filePath);

    if (!await file.exists()) {
      return [];
    }

    final contents = await file.readAsString();
    final List<dynamic> jsonData = jsonDecode(contents);

    return jsonData.map((json) => User.fromJson(json)).toList();
  }

  Future<User?> findByEmail(String email) async {
    final users = await getUsers();

    try {
      return users.firstWhere((user) => user.email == email);
    } catch (e) {
      return null;
    }
  }
}
