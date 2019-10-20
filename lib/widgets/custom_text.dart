import 'package:flutter/material.dart';

class CustomText extends Text {

  CustomText(String data, {textAlign : TextAlign.center, color : Colors.indigo, fontSize : 15.00, fontStyle : FontStyle.normal}):
      super(
        data,
        textAlign : textAlign,
        style : TextStyle(
          color: color,
          fontStyle: fontStyle,
          fontSize: fontSize
        )
      );
}