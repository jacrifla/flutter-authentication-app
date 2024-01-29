import 'package:flutter/material.dart';

void clearFields({
  required TextEditingController emailController,
  required TextEditingController passwordController,
  TextEditingController? usernameController,
  bool? checkboxValue,
  Function? setStateCallback,
}) {
  emailController.clear();
  passwordController.clear();
  usernameController?.clear();
  checkboxValue = false;
  setStateCallback?.call();
}
