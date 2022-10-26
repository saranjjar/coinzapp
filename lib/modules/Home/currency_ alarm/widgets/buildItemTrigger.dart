
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildItemTrigger() {
  return Container(
    height: 60,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: HexColor('#F4F4F4')
        )
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/images/btc.svg',height: 35,width: 35,fit: BoxFit.contain,),
          SizedBox(width: 5,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bitcoin'),
                Row(
                  children: [
                    Text('يساوي'),
                    Text('\$1452'
                        '')
                  ],
                )

              ],
            ),
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.delete,color: Colors.green,))
        ],
      ),
    ),
  );
}
