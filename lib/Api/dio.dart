import 'package:coinz/Application/Application.dart';
import 'package:dio/dio.dart';

Dio DioHelper(){

  Dio dio = Dio();
  dio.options.connectTimeout=5000;
  dio.options.baseUrl='https://newline.dev/currency/api/v1';
  dio.options.headers = {
    'X-Client-Device-UDID' : Application.uid
  };

  return dio;

}