import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'user.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static User myUser = User(
    image: "assets/images/Dp.png",
    name: 'XYZ',
    email: 'xyz@gmail.com',
    phone: '9876543210',
    location:'Paris'
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
