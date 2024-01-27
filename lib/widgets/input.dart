import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Input extends StatelessWidget {
  final String? input;
  final String? colorPlaceholder;
  final String? primaryColor;
  final String? labelText;
  final IconData? prefixIcon;
  final bool obscureText;

  Input({
    super.key,
    this.input,
    this.colorPlaceholder,
    this.primaryColor,
    this.labelText,
    this.prefixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            floatingLabelAlignment: FloatingLabelAlignment.center,
            hintText: labelText,
            hintStyle: TextStyle(
                color: HexColor(colorPlaceholder ?? '000000'), fontSize: 20),
            filled: true,
            fillColor: HexColor(input ?? 'ffffff'),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: HexColor(primaryColor ?? 'ffffff'),
                  )
                : null,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30)),
          ),
          style: TextStyle(color: HexColor(colorPlaceholder ?? '000000')),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
