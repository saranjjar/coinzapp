import 'package:dio/dio.dart';
import '../constant.dart';
import '../dio.dart';


class NewsController{

  static Future<Response>  getNewsList(){
    return DioHelper().get(Constant.newsUrl);
  }
}