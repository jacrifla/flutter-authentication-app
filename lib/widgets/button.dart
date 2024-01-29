// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Button extends StatelessWidget {
  final String? colorTextButton;
  final String? backgroundButton;
  final String textButton;
  final VoidCallback onPressCallback;
  final Widget? loadingIndicator;
  final bool isLoading;

  const Button({
    Key? key,
    required this.onPressCallback,
    required this.textButton,
    this.colorTextButton,
    this.backgroundButton,
    this.loadingIndicator,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              HexColor(backgroundButton ?? '000000'),
            ),
          ),
          onPressed: isLoading ? null : onPressCallback,
          child: isLoading
              ? loadingIndicator ?? CircularProgressIndicator()
              : Text(
                  textButton.toUpperCase(),
                  style: TextStyle(
                    color: HexColor(colorTextButton ?? 'FFFFFF'),
                    fontSize: 16,
                  ),
                )),
    );
  }
}
