import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildTextButton({required Function() onPressed}) {
  return Container(
    height: 55,
    width: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(colors:[
          HexColor('#FFDB00'),
          Colors.orange
        ],
        ),
        borderRadius: BorderRadius.circular(12)
    ),
    child: TextButton(
        onPressed: onPressed,
        child: Text('إضافة تنبيه',style: TextStyle(
            color: Colors.black,
            fontSize:18
        ),)),
  );
}