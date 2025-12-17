import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) {
  print("Welcome to Task Tracker!\nTo Get Started");

  print('Enter Your Name: ');
  String? name = stdin.readLineSync();

  print('Enter Your Email: ');
  String? email = stdin.readLineSync();

  print('Enter Your Password: ');
  String? password = stdin.readLineSync();

  Map<String, dynamic> creds = {
    'name': name,
    'email': email,
    'password': password,
    'created_at': DateTime.now().toIso8601String(),
  };

  saveToJson(creds);

  print('\nUser saved successfully ✅');
}

void saveToJson(Map<String, dynamic> data) {
  final file = File('users.json');

  List users = [];

  // If file exists, read existing data
  if (file.existsSync()) {
    final content = file.readAsStringSync();
    if (content.isNotEmpty) {
      users = jsonDecode(content);
    }
  }

  // Add new user
  users.add(data);

  // Save back to file (pretty format)
  file.writeAsStringSync(JsonEncoder.withIndent('  ').convert(users));
}
