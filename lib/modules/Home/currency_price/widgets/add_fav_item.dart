import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget addFavItem() {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset('assets/images/icons8-plus.svg'),
        SizedBox(
          height: 5,
        ),
        Text(
          'اضغط للإضافة',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
