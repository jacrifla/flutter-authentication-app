// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:textfield/constants/app_colors.dart';
import 'package:textfield/widgets/terms_and_conditions.dart';
import 'package:textfield/widgets/footer.dart';
import 'package:textfield/widgets/input.dart';
import 'package:textfield/widgets/big_title.dart';

import '../utils/utils.dart';
import '../widgets/button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  String? _emailErrorText;
  String? _passwordErrorText;
  String? _usernameErrorText;
  bool _isChecked = false;
  bool _isTermsCheckedError = false;
  final String _termsErrorText = 'Please accept the terms.';

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(AppColors.background),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigTitle(
                title: 'Sing Up',
                colorText: AppColors.primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Input(
                        controllerInput: _emailController,
                        primaryColor: AppColors.primaryColor,
                        labelText: 'Your email',
                        colorPlaceholder: AppColors.inputPlaceholder,
                        prefixIcon: Icons.mail_outline,
                        input: AppColors.input,
                        errorText: _emailErrorText,
                        validator: (value) {
                          setState(() {
                            _emailErrorText = value!.isEmpty
                                ? 'Please enter a valid email address.'
                                : null;
                          });
                          return null;
                        },
                      ),
                      Input(
                        controllerInput: _usernameController,
                        primaryColor: AppColors.primaryColor,
                        labelText: 'username',
                        colorPlaceholder: AppColors.inputPlaceholder,
                        prefixIcon: Icons.person_outline_outlined,
                        input: AppColors.input,
                        errorText: _usernameErrorText,
                        validator: (value) {
                          setState(() {
                            _usernameErrorText = value!.isEmpty
                                ? 'Please enter a valid username.'
                                : null;
                          });
                          return null;
                        },
                      ),
                      Input(
                        controllerInput: _passwordController,
                        primaryColor: AppColors.primaryColor,
                        labelText: 'Your password',
                        colorPlaceholder: AppColors.inputPlaceholder,
                        prefixIcon: Icons.lock_outline,
                        input: AppColors.input,
                        errorText: _passwordErrorText,
                        validator: (value) {
                          setState(() {
                            _passwordErrorText = value!.isEmpty
                                ? 'Please enter a valid password.'
                                : null;
                          });
                          return null;
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                fillColor:
                                    MaterialStatePropertyAll(Colors.white),
                                checkColor: Colors.amber,
                                value: _isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    _isChecked = value!;
                                    _isTermsCheckedError = false;
                                  });
                                },
                              ),
                              TermsAndConditions(),
                            ],
                          ),
                          if (_isTermsCheckedError)
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 14.0), // Ajusta o recuo do texto
                              child: Text(
                                _termsErrorText,
                                style: TextStyle(
                                  color: HexColor(AppColors.warning),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Button(
                        onPressCallback: () async {
                          setState(() {
                            _isTermsCheckedError = !_isChecked;
                          });

                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate() &&
                              _emailErrorText == null &&
                              _usernameErrorText == null &&
                              _passwordErrorText == null) {
                            if (!_isTermsCheckedError) {
                              setState(() {
                                _isLoading = true;
                              });

                              await Future.delayed(const Duration(seconds: 2));

                              Navigator.pushNamed(context, '/home').then((_) {
                                setState(() {
                                  _isLoading = false;
                                });

                                if (_isChecked) {
                                  clearFields(
                                    emailController: _emailController,
                                    passwordController: _passwordController,
                                    setStateCallback: setState,
                                    usernameController: _usernameController,
                                    checkboxValue: _isChecked = false,
                                  );
                                }
                              });
                            }
                          }
                        },
                        textButton: 'create account',
                        backgroundButton: AppColors.primaryColor,
                        isLoading: _isLoading,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(
        beforeText: 'Already have an account?',
        linkText: 'Sign In',
        linkTextColor: AppColors.primaryColor,
        dividerColor: AppColors.primaryColor,
        onTapRoute: () {
          Navigator.pushNamed(context, '/');
        },
      ),
    );
  }
}
