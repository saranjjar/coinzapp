
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DropdownWidgetwotState extends StatefulWidget {

  late List<dynamic> list;
  var selectedItem;

  DropdownWidgetwotState({list,selectedItem,});
  @override
  State<DropdownWidgetwotState> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidgetwotState> {

  String? selectedItem;
  List<String> list =[
    'أكبر من','أقل من'
    ];


  @override
  initState() {
    super.initState();
    selectedItem = list[0];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 80,
      width: 170,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)
              )
          ),
          value: selectedItem,
          icon: SvgPicture.asset('assets/images/icons_arrow.svg',height: 10,width: 10,),
          onChanged: (String? newItem) {
            setState(() {
              selectedItem = newItem!;
            });
          },
          items: list.map((String map) {
            return  DropdownMenuItem<String>(
              value: map, child: Container(
              height: 80,
              width: 80,
              child:Text(map),
            ));
          }).toList(),
        ),
      ),
    );
  }
}
