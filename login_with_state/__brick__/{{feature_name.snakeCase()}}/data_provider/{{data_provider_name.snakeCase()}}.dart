import 'dart:async';
import '{{state_name.snakeCase()}}.dart';
import 'package:flutter/material.dart';

class {{data_provider_name.pascalCase()}} extends ChangeNotifier {
  
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late {{state_name.pascalCase()}} state;

  initState() {
    usernameController.clear();
    passwordController.clear();
    state = {{state_name.pascalCase()}}(
      apiStream: StreamController()
    );
  }

  verifyInput() {
    state = state.copyWith(
      emailError: state.email.isEmpty,
      passwordError: state.password.isEmpty,
    );
    notifyListeners();
  }

  onSubmitPressed() {
    verifyInput();
    if (!state.emailError && !state.passwordError) {
      //TODO call API service
    }
  }

  updateEmail(String emailValue) {
    state = state.copyWith(email: emailValue);
  }

  updatePassword(String passwordValue) {
    state = state.copyWith(password: passwordValue);
  }
}
