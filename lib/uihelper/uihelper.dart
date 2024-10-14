import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UiHelper{


  static Widget reusableText(String message, {double size = 14.0,
        Color color = Colors.black}) {
    return Text(
      message,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: color,
      ),
    );
  }




}