
import 'package:coinz/Api/Repo/trigger_repo.dart';
import 'package:coinz/Application/Application.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../model/add_trigger_model.dart';
import '../model/trigger_model.dart';

class TriggerxController extends GetxController {

  List<TCondition> listTrigger = [];
  bool isLoadingRequest = false;
  bool isLoadingdelRequest = false;

  int coinzIndex = 0;

  void changeCoinzType({required int index}) {
    coinzIndex = index;
    update();
  }

  deleteTrigger(int id) async{
    isLoadingdelRequest = true;
      update();
      await TriggerRepo.instance.deleteTriggerRequest(id: id);
      getTrigger();
      isLoadingdelRequest = false;
      update();
  }
  getTrigger() async {
      isLoadingRequest = true;
      update();
      listTrigger =
      await TriggerRepo.instance.getTriggerRequest();
      isLoadingRequest = false;
      update();
    }

  TStatus? tStatus;

   void postTrigger  ({
    required BuildContext context,
    required String name,
    required int type,
    required String value,
    required String UDUD,
  }) async
  {
    isLoadingRequest = true;
    update();
    tStatus = await TriggerRepo.instance.postTriggerRequest(
        context: context,
        name: name,
        type: type,
        value: value,
        UDUD: UDUD

    );
    getTrigger();
    isLoadingRequest = false;

  }
  //
  // bool check = false;
  //
  // int coinzIndex = 0;
  //
  // void changeCoinzType({required int index}) {
  //   coinzIndex = index;
  //   update();
  // }

  List<String> valueType = [
    'أكبر من',
    'يساوي',
    'أقل من',
  ];

  int valueIndex = 0;

  void changeValueType({required int index}) {
    valueIndex = index;
    update();
  }

  int type(String value) {
    int result;
    switch (value) {
      case 'أكبر من':
        result = 3;
        break;
      case 'يساوي':
        result = 2;
        break;
      case 'أقل من':
        result = 1;
        break;
      default:
        result = 1;
        break;
    }
    return result;
  }

  String Itype(String value) {
    String result;
    switch (value) {
      case '3':
        result = 'أكبر من';
        break;
      case '2':
        result = 'يساوي';
        break;
      case '1':
        result = 'أقل من';
        break;
      default:
        result = '';
        break;
    }
    return result;
  }


  Color colors(String value) {
    Color res;
    switch (value) {
      case 'أكبر من':
        res = Colors.orange;
        break;
      case 'يساوي':
        res = Colors.green;
        break;
      case 'أقل من':
        res = Colors.red;
        break;
      default:
        res = Colors.black;
        break;
    }
    return res;
  }
  @override
  void onInit() {
    getTrigger();
    super.onInit();
  }
}
