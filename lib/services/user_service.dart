import '../models/user.dart';
import 'user_storage.dart';

class UserService {
  final UserStorage _storage;

  UserService(this._storage);

  Future<void> registerUser(User user) async {
    await _storage.saveUser(user);
  }

  Future<User?> login(String email, String password) async {
    final user = await _storage.findByEmail(email);

    if (user == null) {
      return null;
    }

    if (user.password != password) {
      return null;
    }

    return user;
  }

  Future<List<User>> getAllUsers() async {
    return await _storage.getUsers();
  }
}
