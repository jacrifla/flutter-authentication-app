// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:textfield/constants/app_colors.dart';
import 'package:textfield/widgets/big_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor(AppColors.background),
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: BigTitle(
            title: 'Jaque',
            colorText: AppColors.primaryColor,
          ),
        ));
  }
}
