// ignore_for_file: prefer_const_constructors

import 'package:design/components/constants.dart';
import 'package:design/modules/StartScreen.dart';
import 'package:flutter/material.dart';

import 'modules/LoginScreen/FristLogin.dart';
import 'modules/RegisterScreen/FristRegister.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design',
    routes:
    {
      FristLogin.id:(context)=>FristLogin(),
      FristRegister.id:(context)=>FristRegister(),
    },
      home:startScreen(),
    );
  }
}
