import '../models/user.dart';
import 'user_storage.dart';

class UserService {
  final UserStorage _storage;

  UserService(this._storage);

  Future<void> registerUser(User user) async {
    await _storage.saveUser(user);
  }

  Future<List<User>> getAllUsers() async {
    return await _storage.getUsers();
  }
}
