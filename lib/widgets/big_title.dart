import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BigTitle extends StatelessWidget {
  final String title;
  final String? colorText;

  const BigTitle({
    super.key,
    required this.title,
    this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Text(
          title.toUpperCase(),
          style: TextStyle(
              color: HexColor(colorText ?? '000000'),
              fontSize: 36,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
