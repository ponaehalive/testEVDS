import 'package:flutter/material.dart';
import 'package:test1011/base/base_vm.dart';
import 'package:test1011/screens/user/user_screen.dart';

class MainScreenViewModel extends ChangeNotifier with BaseViewModel {
  bool canProceed = false;
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String login = '';
  String password = '';
  bool hidePassword = true;
  bool isEyeIconActive = false;
  bool isLoginCorrect = false;

  void init() {
    // ignore: avoid_print
    print('main page init');
  }

  void changeLogin(String value) {
    login = loginController.text;
    checkFields();
    notifyListeners();
  }

  void changePassword(String value) {
    password = passwordController.text;
    checkFields();
    notifyListeners();
  }

  void checkFields() {
    if (password.isNotEmpty) {
      isEyeIconActive = true;
    } else if (password.isEmpty) {
      isEyeIconActive = false;
    }
    if (login.isNotEmpty && password.isNotEmpty) {
      canProceed = true;
      notifyListeners();
    } else if (login.isEmpty || password.isEmpty) {
      canProceed = false;
      notifyListeners();
    }

    //can add any logic. emailValidator etc.
    if (login.length > 5) {
      isLoginCorrect = true;
      notifyListeners();
    } else if (login.length < 5) {
      isLoginCorrect = false;
      notifyListeners();
    }
  }

  void onEyeTap() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  void tryLogin(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserScreen(),
      ),
    );
  }

  String get buttonTitle => 'Sign in';
  String get forgotPasswordText => 'Forgot Password?';
  String get passwordText => 'Password';
  String get loginText => 'Username';
  String get signInText => 'Sign in';
}
