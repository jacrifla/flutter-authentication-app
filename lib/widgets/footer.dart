// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Footer extends StatelessWidget {
  final String? dividerColor;
  final String beforeText;
  final String linkText;
  final String? linkTextColor;
  final VoidCallback? onTapRoute;

  const Footer({
    Key? key,
    this.dividerColor,
    required this.beforeText,
    required this.linkText,
    this.linkTextColor,
    this.onTapRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Column(
        children: [
          Divider(
            color: HexColor(dividerColor ?? '000000'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                beforeText,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: onTapRoute,
                child: Text(
                  linkText,
                  style: TextStyle(
                    color: HexColor(linkTextColor ?? '000000'),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
