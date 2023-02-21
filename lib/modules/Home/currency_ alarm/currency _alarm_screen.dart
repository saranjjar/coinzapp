
import 'package:coinz/Application/Application.dart';
import 'package:coinz/controller/currency_controller.dart';
import 'package:coinz/controller/trigger_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyAlarmScreen extends StatelessWidget {

  var valueController = TextEditingController();
  final controllerTrigger = Get.put(TriggerxController());
  final controllerCurrency = Get.put(CurrencyxController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TriggerxController>(

        builder: (controller) => Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'منبه العملات',
                            style: TextStyle(
                                fontFamily: 'Swissra',
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'يرجى اختيار نوع العملة',
                            style: TextStyle(
                                fontFamily: 'Swissra',
                                fontSize: 14,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black12, width: 0.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: AlertDialog(
                                            scrollable: true,
                                            title: const Text('اختر نوع العملة'),
                                            content: Column(
                                                children: List.generate(
                                                    controllerCurrency
                                                        .listCurrencies
                                                        .length, (index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  controller.changeCoinzType(
                                                      index: index);
                                                  Navigator.pop(context);
                                                },
                                                child: ListTile(
                                                  leading: Image(
                                                    image: NetworkImage(
                                                        controllerCurrency
                                                            .listCurrencies[index]
                                                            .sIcon!),
                                                    width: 23,
                                                    height: 23,
                                                  ),
                                                  title: Text(
                                                    controllerCurrency
                                                        .listCurrencies[index]
                                                        .sName!,
                                                  ),
                                                ),
                                              );
                                            }))),
                                      ));
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Image.network(controllerCurrency
                                            .listCurrencies[controller.coinzIndex]
                                            .sIcon!)),
                                    SizedBox(width: 10,),
                                    Text(
                                        '${controllerCurrency.listCurrencies[controller.coinzIndex].sName!}'),
                                  const Spacer(),
                                    const Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'يرجى تحديد نوع المنبه',
                            style: TextStyle(
                                fontFamily: 'Swissra',
                                fontSize: 14,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(8),
                              // border: Border.all(color: Colors.black12, width: 0.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width/2 -21,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadiusDirectional.only(
                                          topStart: Radius.circular(10),
                                          bottomStart: Radius.circular(10)),
                                      border: Border.all(
                                          color: Colors.grey[300]!, width: 0.8)),

                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: AlertDialog(
                                                scrollable: true,
                                                content: Column(
                                                    children: List.generate(
                                                        controllerTrigger.valueType.length, (index) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          controller.changeValueType(
                                                              index: index
                                                          );
                                                          Navigator.pop(context);
                                                        },
                                                        child: ListTile(
                                                          title: Text(
                                                            controller.valueType[index]
                                                          ),
                                                        ),
                                                      );
                                                    })
                                                )
                                            ),
                                          ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        children: [
                                          Text(
                                              '${controller.valueType[controller.valueIndex]}'),
                                          Spacer(),
                                          Icon(Icons.arrow_drop_down),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width/2 -20,
                                   decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.only(
                                    topEnd: Radius.circular(10),
                                    bottomEnd: Radius.circular(10)),
                                border: Border.all(
                                    color: Colors.grey[300]!, width: 0.8)),
                                  child: TextFormField(
                                    controller: valueController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: '10000   \$',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.purple, Colors.pinkAccent],
                              )
                            ),
                            child: TextButton(
                                onPressed: (){
                                  controller.postTrigger(
                                      context: context,
                                      name: controllerCurrency.listCurrencies[controller.coinzIndex].sCode!,
                                      type: controller.type(controller.valueType[controller.valueIndex]),
                                      value: valueController.text,
                                      UDUD:  Application.uid!

                                  );
                                }, child: const Text(
                              'اضافة تنبيه',
                              style: TextStyle(
                                fontFamily: 'Swissra',
                                color: Colors.white,
                              ),
                            )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          controller.isLoadingRequest?
                             Center(child: CircularProgressIndicator())
                          :ListView.separated(
                             shrinkWrap: true,
                             scrollDirection: Axis.vertical,
                             physics: BouncingScrollPhysics(),
                             itemBuilder: (context,index)=>Container(
                               height: 70,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                                 border: Border.all(
                                   color: Colors.black12,
                                   width: 0.5
                                 )
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Row(
                                   children: [
                                     Container(
                                         height: 20,
                                         width: 20,
                                         child: Image(
                                             image: NetworkImage(
                                                 '${controller.listTrigger[index].sIcon}')),
                                     ),
                                     Expanded(child: Column(
                                       children: [
                                         Text('${controller.listTrigger[index].sCode}'),
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Text('${controller.Itype(controller.listTrigger[index].iType!)}',style: TextStyle(
                                               fontSize: 10,
                                                 color: controller.colors(controller.valueType[index])
                                             ),),
                                             SizedBox(width: 10,),
                                             Text('${controller.listTrigger[index].dValue}',
                                             style: TextStyle(
                                                 fontSize: 10,
                                                  color: controller.colors(controller.valueType[index])
                                             ),
                                             )
                                           ],
                                         ),
                                       ],
                                     )),
                                     InkWell(
                                         onTap: (){
                                            controller.deleteTrigger(controller.listTrigger[index].pkIId!);
                                         },
                                         child: Icon(Icons.delete,color: Colors.red,))
                                   ],
                                 ),
                               ),
                             ),
                              separatorBuilder: (context,index)=>SizedBox(
                                height: 15,
                              ),
                              itemCount: controller.listTrigger.length,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}

//
// import 'package:coinz/controller/currency_controller.dart';
// import 'package:coinz/modules/Home/currency_%20alarm/widgets/text_btn.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:hexcolor/hexcolor.dart';
// import '../../../controller/trigger_controller.dart';
// import '../../../model/trigger_model.dart';
//
// class CurrencyAlarmScreen extends StatelessWidget {
//   TriggerxController controller = Get.put(TriggerxController());
//   CurrencyxController controller1 = Get.put(CurrencyxController());
//
//   TTrigger? selectedAlarm;
//   var valueController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//         textDirection: TextDirection.rtl,
//         child: Scaffold(
//           body: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: SafeArea(
//               child: GetBuilder<TriggerxController>(
//                 builder: (controller) => Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'منبه العملات',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 22,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Text(
//                         'يرجى اختيار نوع العملة',
//                         style: TextStyle(fontSize: 15, color: Colors.grey),
//                       ),
//                       containerStyle(
//                           context: context,
//                           title: controller1.listCurrencies[controller.coinzIndex].sName!,
//                           image: controller1.listCurrencies[controller.coinzIndex].sIcon,
//                           icon: Icons.arrow_drop_down,
//                           onTap: () {
//                             showDialog(
//                                 context: context,
//                                 builder: (context) => Directionality(
//                                   textDirection: TextDirection.rtl,
//                                   child: AlertDialog(
//                                       scrollable: true,
//                                       title: const Text('اختر نوع العملة'),
//                                       content: Column(
//                                         children: List.generate(
//                                             controller1.listCurrencies.length,
//                                                 (index) {
//                                               return GestureDetector(
//                                                 onTap: () {
//                                                   controller.changeCoinzType(index: index);
//                                                   Navigator.pop(context);
//                                                 },
//                                                 child: ListTile(
//                                                   leading: Image(
//                                                     image: NetworkImage(controller1.listCurrencies[index].sIcon!),
//                                                     width: 23,
//                                                     height: 23,
//                                                   ),
//                                                   title: Text(controller1.listCurrencies[index].sName!,),
//                                                 ),
//                                               );
//                                             }),
//                                       )),
//                                 ));
//                           }),
//                       const Text(
//                         'يرجى تحديد نوع المنبه',
//                         style: TextStyle(fontSize: 18, color: Colors.grey),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           containerStyle(
//                               context: context,
//                               title: controller.valueType[controller.valueIndex],
//                               width: MediaQuery.of(context).size.width / 2 - 20,
//                               end: true,
//                               icon: Icons.arrow_drop_down,
//                               onTap: () {
//                                 showDialog(
//                                     context: context,
//                                     builder: (context) => Directionality(
//                                           textDirection: TextDirection.rtl,
//                                           child: Container(
//                                             margin: const EdgeInsets.only(top: 120),
//                                             child: AlertDialog(
//                                                 alignment: Alignment.topCenter,
//                                                 scrollable: true,
//                                                 content: Column(
//                                                   children: List.generate(
//                                                       3,
//                                                       (index) =>
//                                                           GestureDetector(
//                                                             onTap: () {
//                                                               controller.changeValueType(index: index);
//                                                               Navigator.pop(context);
//                                                             },
//                                                             child: ListTile(
//                                                               title: Text(
//                                                                 controller.valueType[index],
//                                                               ),
//                                                             ),
//                                                           )),
//                                                 )),
//                                           ),
//                                         ));
//                               }),
//                           Container(
//                             height: 60,
//                             width: MediaQuery.of(context).size.width / 2 - 20,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadiusDirectional.only(
//                                     topEnd: Radius.circular(10),
//                                     bottomEnd: Radius.circular(10)),
//                                 border: Border.all(
//                                     color: Colors.grey[300]!, width: 0.8)),
//                             child: TextField(
//                               controller: valueController,
//                               keyboardType: TextInputType.number,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 hintText: '10000   \$',
//                                 hintStyle: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       buildTextButton(onPressed: () {
//                         controller.postTrigger(
//                             context: context,
//                             name: controller1.listCurrencies[controller.coinzIndex].sCode!,
//                             type: controller.valueIndex+1,
//                             value: valueController.text
//                         );
//                       }),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       ListView.separated(
//                           scrollDirection: Axis.vertical,
//                           shrinkWrap: true,
//                           physics: BouncingScrollPhysics(),
//                           itemBuilder: (context, index) => buildItemTrigger(context,index),
//                           separatorBuilder: (context, index) => SizedBox(
//                                 height: 5,
//                               ),
//                           itemCount:controller.listTrigger.length
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
//
//   Widget buildItemTrigger(int index){
//     return Row(
//       children: [
//         Image.network('${controller.listTrigger[index].sIcon}'),
//         Expanded(child: Center(child: Text('${controller.listTrigger[index].sName}'))),
//         IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,))
//       ],
//     );
//   }
//
//   // Widget containerStyle(
//   //   {
//   //     required context,
//   //     required String title,
//   //     String? price,
//   //     String? value,
//   //     String? image,
//   //     double? width,
//   //     bool end = false,
//   //     bool isAlarm = false,
//   //     Function()? onTap,
//   //     Function()? onTapIcon,
//   //     IconData? icon}) {
//   //     double screenWidth = MediaQuery.of(context).size.width;
//   //     screenWidth = width ?? screenWidth;
//   //     return
//   //   }
//   // }
//   //
//   // Widget buildItemTrigger(context,index) {
//   //   return Container(
//   //     height: 60,
//   //     decoration: BoxDecoration(
//   //         borderRadius: BorderRadius.circular(12),
//   //         border: Border.all(
//   //             color: HexColor('#F4F4F4')
//   //         )
//   //     ),
//   //     child: Column(
//   //       children: [
//   //         containerStyle(
//   //             context: context,
//   //             title: controller.listTrigger[index].sName!,
//   //             image: controller.listTrigger[index].sIcon,
//   //             value: controller.listTrigger[index].sIcon,
//   //             price: controller.listTrigger[index].iType == '1' ? 'أكبر من'  : controller.listTrigger[index].iType == '2' ? 'يساوي' : 'أصغر من',
//   //             isAlarm: true,
//   //             icon: Icons.restore_from_trash_outlined,),
//   //       ],
//   //     ),
//   //   );
//   // }
//   //
//   // Widget containerStyle(
//   //     {required context,
//   //       required String title,
//   //       String? price,
//   //       String? value,
//   //       String? image,
//   //       double? width,
//   //       bool end = false,
//   //       bool isAlarm = false,
//   //       Function()? onTap,
//   //       Function()? onTapIcon,
//   //       IconData? icon}) {
//   //   double screenWidth = MediaQuery.of(context).size.width;
//   //   screenWidth = width ?? screenWidth;
//   //   return InkWell(
//   //     onTap: onTap,
//   //     child: Container(
//   //       height: isAlarm ? 70 : 60,
//   //       width: screenWidth,
//   //       decoration: BoxDecoration(
//   //           borderRadius: screenWidth == MediaQuery.of(context).size.width
//   //               ? BorderRadius.circular(10)
//   //               : end
//   //               ? const BorderRadiusDirectional.only(
//   //               topStart: Radius.circular(10),
//   //               bottomStart: Radius.circular(10))
//   //               : const BorderRadiusDirectional.only(
//   //               topEnd: Radius.circular(10),
//   //               bottomEnd: Radius.circular(10)),
//   //           border: Border.all(color: Colors.grey[300]!, width: 0.8)),
//   //       child: Padding(
//   //           padding: const EdgeInsets.symmetric(horizontal: 12),
//   //           child: ListTile(
//   //             leading: image != null
//   //                 ? Image(
//   //               image: NetworkImage(image),
//   //               width: 23,
//   //               height: 23,
//   //             )
//   //                 : null,
//   //             title: isAlarm
//   //                 ? Padding(
//   //               padding: const EdgeInsets.all(8.0),
//   //               child: Column(
//   //                 crossAxisAlignment: CrossAxisAlignment.start,
//   //                 children: [
//   //                   Text(
//   //                     title,
//   //                     style: TextStyle(fontSize: 14),
//   //                   ),
//   //                   Text(
//   //                     '${value!}    $price \$',
//   //                     style: TextStyle(
//   //                         fontSize: 11,
//   //                         color: value == 'أكبر من'
//   //                             ? Colors.orange
//   //                             : value == 'يساوي'
//   //                             ? Colors.green
//   //                             : Colors.red),
//   //                   )
//   //                 ],
//   //               ),
//   //             )
//   //                 : Text(title, style: TextStyle(fontSize: 14)),
//   //             trailing: icon != null
//   //                 ? GestureDetector(
//   //                 onTap: onTapIcon,
//   //                 child: Icon(
//   //                   icon,
//   //                   color: isAlarm ? Colors.green : null,
//   //                 ))
//   //                 : null,
//   //           )),
//   //     ),
//   //   );
//   // }
//
// }
