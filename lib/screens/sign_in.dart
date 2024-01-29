// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:textfield/constants/app_colors.dart';
import 'package:textfield/widgets/footer.dart';
import 'package:textfield/widgets/big_title.dart';

import '../utils/utils.dart';
import '../widgets/button.dart';
import '../widgets/input.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _emailErrorText;
  String? _passwordErrorText;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(AppColors.background),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BigTitle(
            title: 'Welcome',
            colorText: AppColors.primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Input(
                    controllerInput: _emailController,
                    input: AppColors.input,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    colorPlaceholder: AppColors.inputPlaceholder,
                    primaryColor: AppColors.primaryColor,
                    labelText: 'Your email',
                    prefixIcon: Icons.mail_outline,
                    errorText: _emailErrorText,
                  ),
                  Input(
                    controllerInput: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid password.';
                      }
                      return null;
                    },
                    input: AppColors.input,
                    colorPlaceholder: AppColors.inputPlaceholder,
                    primaryColor: AppColors.primaryColor,
                    labelText: 'Your password',
                    prefixIcon: Icons.lock_outline,
                    errorText: _passwordErrorText,
                  ),
                  Button(
                    textButton: 'Entrar',
                    backgroundButton: AppColors.primaryColor,
                    onPressCallback: () async {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        if (_emailController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          setState(() {
                            _isLoading = true;
                          });
                          await Future.delayed(const Duration(seconds: 2));

                          Navigator.pushNamed(context, '/home').then((_) {
                            setState(() {
                              _isLoading = false;
                            });
                            clearFields(
                              emailController: _emailController,
                              passwordController: _passwordController,
                              setStateCallback: setState,
                            );
                          });

                          FocusScope.of(context).requestFocus(FocusNode());
                        }
                      } else {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    isLoading: _isLoading,
                  ),
                ],
              ),
            ),
          ),
          Footer(
            beforeText: "Don't have an account?",
            linkText: 'Sign Up',
            linkTextColor: AppColors.primaryColor,
            dividerColor: AppColors.primaryColor,
            onTapRoute: () {
              Navigator.pushNamed(context, '/signup');
            },
          )
        ],
      ),
    );
  }
}
