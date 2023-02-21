import 'package:coinz/Api/controller/trigger_controller.dart';
import 'package:coinz/model/add_trigger_model.dart';
import 'package:coinz/model/trigger_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class TriggerRepo {
  static var instance = TriggerRepo();

  Future<List<TCondition>> getTriggerRequest() async {
    List<TCondition> listTrigger = [];

    Response response = await TriggerController.getTriggerList();

    if (response.statusCode == 200) {
      listTrigger = List<TCondition>.from(response.data["condition"]
          .map((object) => TCondition.fromJson(object)));
    }
    return listTrigger;
  }

/*****************************************************/
  TStatus? tStatus;

  Future<TStatus> postTriggerRequest({
    required context,
    required String name,
    required int type,
    required String value,
    required String UDUD
  }) async {
    Response response;
    try {
      response = await TriggerController.postTrigger(
          context: context, name: name, type: type, value: value,UDID: UDUD);
      if (response.statusCode == 200) {
        tStatus = TStatus.fromJson(response.data);
      }
    } catch (e) {
      tStatus = TStatus.fromJson({
        "status": {"success": false, "code": 0, "message": "التنبيه مضاف مسبقا"}
      });
    }
    return tStatus!;
  }

  Future<TStatus> deleteTriggerRequest({required int id}) async {
    Response response;
    try {
      response = await TriggerController.deleteTrigger(id: id);
      if (response.statusCode == 200) tStatus = TStatus.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return tStatus!;
  }
}
