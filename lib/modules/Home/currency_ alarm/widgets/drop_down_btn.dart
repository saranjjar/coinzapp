// import 'package:coinz/model/currency_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import '../../../../controller/currency_controller.dart';
// import '../../currency_price/model/coinz_model.dart';
//
// class DropDownWidgetState extends StatelessWidget {
//    DropDownWidgetState({Key? key}) : super(key: key);
//    CurrencyxController homeController = Get.find<CurrencyxController>();
//
//   @override
//   Widget build(BuildContext context) {
//     List<TCurrency> list =[
//       TCurrency()
//     ];
//     return Container();
//   }
// }
//
//
// class DropdownWidgetState extends StatefulWidget {
//
//
//   var selectedItem;
//
//   DropdownWidgetState({list,selectedItem,});
//   @override
//   State<DropdownWidgetState> createState() => _DropdownWidgetState();
// }
//
// class _DropdownWidgetState extends State<DropdownWidgetState> {
//
//    CoinzModel? selectedCoinz;
//    List<CoinzModel> list =[
//      CoinzModel(icon: '',type: ''),
//      CoinzModel(icon: '',type: ''),
//      CoinzModel(icon: '',type: ''),
//    ];
//
//
//   @override
//   initState() {
//     super.initState();
//     selectedCoinz = list[0];
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       width: double.infinity,
//       child: DropdownButtonFormField<CoinzModel>(
//         decoration: InputDecoration(
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(width: 1,color: Colors.grey),
//             borderRadius: BorderRadius.circular(8)
//           ),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(width: 1,color: Colors.grey),
//                 borderRadius: BorderRadius.circular(8)
//             )
//         ),
//         value: selectedCoinz,
//         icon: SvgPicture.asset('assets/images/icons_arrow.svg',height: 10,width: 10,),
//         onChanged: (CoinzModel? newCoinz) {
//           setState(() {
//             selectedCoinz = newCoinz!;
//           });
//         },
//         items: list.map((CoinzModel map) {
//           return  DropdownMenuItem<CoinzModel>(
//               value: map, child: Container(
//                 height: 100,
//                 width: 150,
//                 child: Row(
//             children: [
//             SvgPicture.asset('${map.icon}',),
//             Text('${map.type}',)
//           ],),
//               ));
//         }).toList(),
//       ),
//     );
//   }
// }
// /*
// * import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../model/coinzModel.dart';
//
//
// class DropdownWidgetState extends StatefulWidget {
//
//   late List<dynamic> list;
//   var selectedItem;
//
//   DropdownWidgetState({list,selectedItem,});
//   @override
//   State<DropdownWidgetState> createState() => _DropdownWidgetState();
// }
//
// class _DropdownWidgetState extends State<DropdownWidgetState> {
//
//    CoinzModel? selectedCoinz;
//    List<CoinzModel> list =[
//      CoinzModel(icon: '',type: ''),
//      CoinzModel(icon: '',type: ''),
//      CoinzModel(icon: '',type: ''),
//    ];
//
//
//   @override
//   initState() {
//     super.initState();
//     selectedCoinz = list[0];
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       width: double.infinity,
//       child: DropdownButtonFormField<CoinzModel>(
//         decoration: InputDecoration(
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(width: 1,color: Colors.grey),
//             borderRadius: BorderRadius.circular(8)
//           ),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(width: 1,color: Colors.grey),
//                 borderRadius: BorderRadius.circular(8)
//             )
//         ),
//         value: selectedCoinz,
//         icon: SvgPicture.asset('assets/images/icons_arrow.svg',height: 10,width: 10,),
//         onChanged: (CoinzModel? newCoinz) {
//           setState(() {
//             selectedCoinz = newCoinz!;
//           });
//         },
//         items: list.map((CoinzModel map) {
//           return  DropdownMenuItem<CoinzModel>(
//               value: map, child: Container(
//                 height: 100,
//                 width: 150,
//                 child: Row(
//             children: [
//             SvgPicture.asset('${map.icon}',),
//             Text('${map.type}',)
//           ],),
//               ));
//         }).toList(),
//       ),
//     );
//   }
// }
//
// * */