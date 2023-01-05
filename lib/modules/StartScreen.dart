// ignore_for_file: file_names, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:design/components/components.dart';
import 'package:flutter/material.dart';

import 'RegisterScreen/FristRegister.dart';

class startScreen extends StatelessWidget {
  const startScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image:DecorationImage(
          image: AssetImage('assets/images/chat.gif'),
          fit: BoxFit.fill,
          
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Padding(
             padding: const EdgeInsets.only(left: 100,right: 100),
             child: myButton(
               onPressed: (){
               //  register
                 Navigator.pushNamed(context, FristRegister.id);
               },
               text: 'Sign_In',
               background: Colors.blueAccent,
               raduis: 30,
             ),
           ),
            Padding(
              padding: const EdgeInsets.only(left: 100,right: 100,bottom: 100,top: 20),
              child: myButton(
                onPressed: (){
                  //login
                  Navigator.pushNamed(context, 'FristLogin');
                },
                text: 'Sign_up',
                background: Colors.blueAccent,
                raduis: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
