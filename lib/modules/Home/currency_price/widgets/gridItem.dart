import 'package:coinz/model/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


List<Color> color1 = [ Colors.purple,Colors.orangeAccent,Colors.green,Colors.blue,];
List<Color> color2 = [Colors.pinkAccent, Colors.yellow, Colors.greenAccent, Colors.blueAccent];

Widget gridItem(index,TCurrency model) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            colors: [
              color1[index],
              color2[index],
            ],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd
        )),
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network('${model.sIcon}',height: 20,width: 20,),
          SizedBox(height: 5,),
          Text('${model.sName}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Text('${model.dValue}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
        ],
      ),
    ),
  );
}
