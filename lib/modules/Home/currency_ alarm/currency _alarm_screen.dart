
import 'package:coinz/modules/Home/currency_%20alarm/widgets/buildItemTrigger.dart';
import 'package:coinz/modules/Home/currency_%20alarm/widgets/dropdowntwo.dart';
import 'package:coinz/modules/Home/currency_%20alarm/widgets/text_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../Shared/components/components.dart';
import '../../../controller/trigger_controller.dart';
import '../../../model/trigger_model.dart';

class CurrencyAlarmScreen extends StatelessWidget {

  TriggerxController controller = Get.put(TriggerxController());
  TTrigger? selectedAlarm;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child:GetBuilder<TriggerxController>(builder: (controller)=> Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('منبه العملات',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),),
                  const SizedBox(height: 10,),
                  const Text('يرجى اختيار نوع العملة',style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey
                   ),),
                     DropdownButtonFormField<TTrigger>(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1,color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1,color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)
                              )
                          ),
                          value: selectedAlarm,
                          icon:  SvgPicture.asset('assets/images/icons_arrow.svg',height: 10,width: 10,),
                          iconSize: 30,
                          elevation: 16,
                          style: TextStyle(color: Colors.purple[700]),
                          onChanged: (TTrigger? newAlarm) {
                            selectedAlarm = newAlarm;
                          },
                          items: controller.listTrigger.map((map) {
                            return DropdownMenuItem<TTrigger>(
                                value: map,
                                child: Container(
                                  height: 20,
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Image.network(
                                        '${map.sIcon}'
                                      ),
                                      const SizedBox(width: 20,),
                                      Text(
                                        '${map.sName}',
                                      )
                                    ],
                                  ),
                                ));
                          }).toList(),
                        ),
                      const Text('يرجى تحديد نوع المنبه',style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey
                  ),),
                  const SizedBox(height: 10,),
                    Row(
                      children: [
                        DropdownWidgetwotState(),
                        const SizedBox(width: 5,),
                        textFormFailed()
                      ],
                    ),
                  const SizedBox(height: 20,),
                  buildTextButton(),
                  const SizedBox(height: 20,),
                  ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index)=>buildItemTrigger(),
                      separatorBuilder: (context,index)=>SizedBox(height: 5,),
                      itemCount: 8
                  )
                ],
              ),
            ),
          ),
      ),
        ),
    ));
  }

}
