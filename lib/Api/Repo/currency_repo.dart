
import 'package:coinz/Api/controller/currency_controller.dart';

import '../../model/currency_model.dart';

import 'package:dio/dio.dart';

class CurrencyRepo{

  static var instance = CurrencyRepo();

  Future<List<TCurrency>> getCurrencyRequest({Map<String,dynamic>? map}) async{

    List<TCurrency> listCurrencies=[];

    Response response = await CurrencyController.getCurrencyList(map: map);

    if(response.statusCode == 200){

      listCurrencies =
      List<TCurrency>.
      from(response.data["currencies"]
          .map((object) =>
          TCurrency.fromJson(object))
      );

    }

    return listCurrencies;
  }
}