// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Agree To',
          style: TextStyle(
            color: HexColor('FFFFFF'),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
            onTap: () {
              _showPopup(context);
            },
            child: Text(
              'Terms And Conditions',
              style: TextStyle(
                  color: HexColor('FFFFFF'),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: HexColor('ffffff')),
            ))
      ],
    );
  }
}

void _showPopup(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Terms and Conditions'),
          content: Text('Lorem Ipsum and others are true and will never.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel')),
          ],
        );
      });
}
