import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    address: '',
    id: '',
    name: '',
    email: '',
    password: '',
    token: '',
    type: '',
    cart: [],
  );

  //get user
  User get user => _user;

  //set user
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
