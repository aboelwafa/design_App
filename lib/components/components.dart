import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

Widget myButton({
  double width=double.infinity,
  double height=60,
  double raduis=20,
  Color background=Colors.blue,
  Color textcolor=Colors.white,
  String fontfamily='Pacifico',
  double sizeText=20,
  required String text,
  required void Function()? onPressed,
})=>Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(raduis),
    color: background,

  ),
  child: MaterialButton(

    onPressed: onPressed,
    minWidth: 80,
    child:
    DefaultTextStyle(
      style:  TextStyle(
        fontSize: sizeText,
        color: textcolor,
        shadows: [
          Shadow(
            blurRadius: 7.0,
            color: textcolor,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: AnimatedTextKit(
        repeatForever: true,
        animatedTexts: [
          FlickerAnimatedText(text,textStyle: TextStyle(fontFamily: fontfamily)),
        ],
      ),
    )
  ),
);