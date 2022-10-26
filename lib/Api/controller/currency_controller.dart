import 'package:dio/dio.dart';
import '../constant.dart';
import '../dio.dart';


class CurrencyController{

  static Future<Response>  getCurrencyList({Map<String,dynamic>? map}){
    return DioHelper().get(Constant.currenciesUrl,queryParameters: map);
  }

}