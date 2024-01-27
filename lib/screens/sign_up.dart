import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:textfield/constants/app_colors.dart';
import 'package:textfield/widgets/terms_and_conditions.dart';
import 'package:textfield/widgets/footer.dart';
import 'package:textfield/widgets/input.dart';
import 'package:textfield/widgets/big_title.dart';

import '../widgets/button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(AppColors.background),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BigTitle(
            title: 'Sing Up',
            colorText: AppColors.primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Input(
                  primaryColor: AppColors.primaryColor,
                  labelText: 'Your email',
                  colorPlaceholder: AppColors.inputPlaceholder,
                  prefixIcon: Icons.mail_outline,
                  input: AppColors.input,
                ),
                Input(
                  primaryColor: AppColors.primaryColor,
                  labelText: 'username',
                  colorPlaceholder: AppColors.inputPlaceholder,
                  prefixIcon: Icons.person_outline_outlined,
                  input: AppColors.input,
                ),
                Input(
                  primaryColor: AppColors.primaryColor,
                  labelText: 'Your password',
                  colorPlaceholder: AppColors.inputPlaceholder,
                  prefixIcon: Icons.lock_outline,
                  input: AppColors.input,
                ),
                Button(
                  textButton: 'create account',
                  backgroundButton: AppColors.primaryColor,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    TermsAndConditions(),
                  ],
                ),
              ],
            ),
          ),
          Footer(
            beforeText: 'Already have an account?',
            linkText: 'Sign In',
            linkTextColor: AppColors.primaryColor,
            dividerColor: AppColors.primaryColor,
            onTapRoute: () {
              Navigator.pushNamed(context, '/');
            },
          )
        ],
      ),
    );
  }
}
