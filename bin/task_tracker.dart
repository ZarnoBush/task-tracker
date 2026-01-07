import 'dart:io';
import 'dart:convert';
import 'package:task_tracker/models/user.dart';
import 'package:task_tracker/services/user_storage.dart';
import 'package:task_tracker/services/validators.dart';

void main(List<String> arguments) async {
  print("Welcome to Task Tracker!\nTo Get Started");

  final userStorage = UserStorage();

  stdout.write("Enter your name: ");
  String? name = stdin.readLineSync();
  final nameError = Validators.validateName(name);

  if (nameError != null) {
    print('Error: $nameError');
    return;
  }
  stdout.write("Enter your email: ");
  String? email = stdin.readLineSync();
  final emailError = Validators.validateEmail(email);

  if (emailError != null) {
    print('Error: $emailError');
    return;
  }

  stdout.write("Enter your password: ");
  String? password = stdin.readLineSync();
  final passwordError = Validators.validatePassword(password);

  if (passwordError != null) {
    print('Error: $passwordError');
    return;
  }

  User newUser = User(name: name, email: email, password: password);

  await userStorage.saveUser(newUser);

  print('\nUser Registered Successfully!');

  // Read users back
  List<User> users = await userStorage.getUsers();

  print('\nRegistered Users:');
  for (var user in users) {
    print(
      'Name: ${user.name}, Email: ${user.email}, Created At: ${user.toJson()['created_at']}',
    );
  }
}
