import 'package:dio/dio.dart';
import '../constant.dart';
import '../dio.dart';


class TriggerController{

  static Future<Response>  getTriggerList(){
    return DioHelper().get(Constant.triggerUrl);
  }
  
  static Future<Response> postTrigger({Map<String, dynamic>? data,Map<String, dynamic>? query}){
    return DioHelper().post(Constant.addtriggerUrl , data: data, queryParameters: query??null);
  }

}