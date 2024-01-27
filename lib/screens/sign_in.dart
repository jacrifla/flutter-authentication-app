import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:textfield/constants/app_colors.dart';
import 'package:textfield/widgets/footer.dart';
import 'package:textfield/widgets/big_title.dart';

import '../widgets/button.dart';
import '../widgets/input.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
            child: Column(
              children: [
                Input(
                  input: AppColors.input,
                  colorPlaceholder: AppColors.inputPlaceholder,
                  primaryColor: AppColors.primaryColor,
                  labelText: 'Your email',
                  prefixIcon: Icons.mail_outline,
                ),
                Input(
                  obscureText: true,
                  input: AppColors.input,
                  colorPlaceholder: AppColors.inputPlaceholder,
                  primaryColor: AppColors.primaryColor,
                  labelText: 'Your password',
                  prefixIcon: Icons.lock_outline,
                ),
                Button(
                  textButton: 'Entrar',
                  backgroundButton: AppColors.primaryColor,
                ),
              ],
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
