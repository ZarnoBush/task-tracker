import 'package:task_tracker/models/user.dart';
import 'package:task_tracker/services/user_service.dart';
import 'package:task_tracker/services/user_storage.dart';
import 'package:task_tracker/services/validators.dart';
import 'package:task_tracker/utils/input_helper.dart';

void main(List<String> arguments) async {
  print("Welcome to Task Tracker!\nTo Get Started");

  final userService = UserService(UserStorage());

  final name = InputHelper.read(
    label: 'Enter Name: ',
    validate: Validators.validateName,
  );
  final email = InputHelper.read(
    label: 'Enter Email: ',
    validate: Validators.validateEmail,
  );
  final password = InputHelper.read(
    label: 'Enter Password: ',
    validate: Validators.validatePassword,
  );

  final user = User(name: name, email: email, password: password);
  await userService.registerUser(user);
  print('User registered successfully!');

  final loggedInUser = await userService.login(email, password);

  if (loggedInUser == null) {
    print('Invalid email or password');
    return;
  }

  print('\nWelcome back, ${loggedInUser.name}!\n');
}
