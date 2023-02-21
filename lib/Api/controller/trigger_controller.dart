import 'package:dio/dio.dart';
import '../../Application/Application.dart';
import '../constant.dart';
import '../dio.dart';


class TriggerController{

  static Future<Response>  getTriggerList(){
    print(Application.uid);
    return DioHelper().get(Constant.triggerUrl,options: Options(
      headers: {
        'HeaderClientDeviceUDID': Application.uid
      }
    ));
  }
  
  static Future<Response> postTrigger({
    required context,
    required String name,
    required int type,
    required String value,
    required String UDID,

  }){
    return DioHelper().post(
        Constant.addtriggerUrl , data: {
      's_code': name,
      'i_type': type,
      'd_value': value,
      's_udid': Application.uid,
    });
  }

  static Future<Response> deleteTrigger({required int id}){
    return DioHelper().delete(
      Constant.deleteTriggerUrl,
      queryParameters: {
        'id':id
      }
    );
  }
}