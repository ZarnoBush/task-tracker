import 'dart:io';

typedef validator = String? Function(String?);

class InputHelper {
  static String read({required String label, required validator validate}) {
    while (true) {
      stdout.write('$label: ');
      final input = stdin.readLineSync();

      final error = validate(input);
      if (error != null) {
        print('Error: $error');
      } else {
        return input!;
      }
      print(error);
    }
  }
}
