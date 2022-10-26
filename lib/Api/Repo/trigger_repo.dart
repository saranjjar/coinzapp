import 'package:coinz/Api/controller/trigger_controller.dart';
import 'package:coinz/model/add_trigger_model.dart';
import 'package:coinz/model/trigger_model.dart';
import 'package:dio/dio.dart';

class TriggerRepo {
  static var instance = TriggerRepo();

  Future<List<TTrigger>> getTriggerRequest({Map<String, dynamic>? map}) async {
    List<TTrigger> listTrigger = [];

    Response response = await TriggerController.getTriggerList();

    if (response.statusCode == 200) {
      listTrigger = List<TTrigger>.from(response.data["condition"]
          .map((object) => TTrigger.fromJson(object)));
    }
    return listTrigger;
  }
//
// TStatus? tStatus;
//
//   Future<TStatus?> postAddTriggerRequest() async {
//       Response response = await TriggerController.postTrigger(
//
//       );
//       if(response.statusCode==200){
//
//
//       }
//   }

}
