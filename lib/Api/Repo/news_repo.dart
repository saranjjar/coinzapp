
import 'package:coinz/model/news_model.dart';
import 'package:dio/dio.dart';
import '../controller/news_controller.dart';

class NewsRepo{

  static var instance = NewsRepo();

  Future<List<TNews>> getNewsRequest({Map<String,dynamic>? map}) async{

    List<TNews> listNews=[];

    Response response = await NewsController.getNewsList();

    if(response.statusCode == 200){

      listNews =
      List<TNews>.
      from(response.data["news"]
          .map((object) =>
          TNews.fromJson(object))
      );

    }

    return listNews;
  }
}