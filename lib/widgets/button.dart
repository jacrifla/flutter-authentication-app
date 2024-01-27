import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Button extends StatelessWidget {
  final String? colorTextButton;
  final String? backgroundButton;
  final String textButton;

  const Button({
    super.key,
    this.colorTextButton,
    this.backgroundButton,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            HexColor(backgroundButton ?? '000000'),
          ),
        ),
        onPressed: () {
          print('botão pressionado');
        },
        child: Text(
          textButton.toUpperCase(),
          style: TextStyle(
              color: HexColor(colorTextButton ?? 'FFFFFF'), fontSize: 16),
        ),
      ),
    );
  }
}
