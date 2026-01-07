import 'dart:convert';
import 'dart:io';

import '../models/task.dart';

class TaskStorage {
  final String filePath = 'tasks.json';

  Future<List<Task>> getTasks() async {
    final file = File(filePath);

    if (!await file.exists()) {
      return [];
    }

    final data = jsonDecode(await file.readAsString());
    return (data as List).map((e) => Task.fromJson(e)).toList();
  }

  Future<void> saveTask(Task task) async {
    final tasks = await getTasks();
    tasks.add(task);

    final file = File(filePath);
    await file.writeAsString(jsonEncode(tasks.map((t) => t.toJson()).toList()));
  }

  Future<List<Task>> getTasksForUser(String email) async {
    final tasks = await getTasks();
    return tasks.where((t) => t.userEmail == email).toList();
  }
}
