// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Input extends StatelessWidget {
  final TextEditingController? controllerInput;
  final String? input;
  final String? colorPlaceholder;
  final String? primaryColor;
  final String? labelText;
  final IconData? prefixIcon;
  final bool obscureText;
  final String? errorText;
  final String? Function(String?)? validator;

  const Input({
    Key? key,
    this.controllerInput,
    this.input,
    this.colorPlaceholder,
    this.primaryColor,
    this.labelText,
    this.prefixIcon,
    this.obscureText = false,
    this.errorText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controllerInput,
          obscureText: obscureText,
          decoration: InputDecoration(
            floatingLabelAlignment: FloatingLabelAlignment.center,
            hintText: labelText,
            hintStyle: TextStyle(
              color: HexColor(colorPlaceholder ?? '000000'),
              fontSize: 20,
            ),
            errorText: errorText,
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
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          style: TextStyle(color: HexColor(colorPlaceholder ?? '000000')),
          validator: validator, // Usa a função de validação fornecida
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
