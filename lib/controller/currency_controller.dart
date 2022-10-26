
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../Api/Repo/currency_repo.dart';
import '../model/currency_model.dart';

class CurrencyxController extends GetxController {

   int? index;
  List<TCurrency> fav = [];

  getFavoriteCurrency(index){

    if(listCurrencies.isEmpty)return;
    if(fav.contains(listCurrencies[index])){
          fav.remove(listCurrencies[index]);
          update();
        }else{
          if(fav.length==4) {
            print('sorry can\'t add');
          }else{
            fav.add(listCurrencies[index]);
            update();
          }
        }
        print('*****************');
        print(fav.toString());

  }

  @override
  void onInit() {
    getCurrencies();
    getFavoriteCurrency(index);
    addLoadMoreTrigger();
    super.onInit();
  }

  List<TCurrency> listCurrencies = [];

  ScrollController scrollController = ScrollController();
  bool isLoadingRequest = false;

  var page_number = 1;

  /// Callin Api and getting data From server
  getCurrencies() async {
    isLoadingRequest = true;
    update();
    Map<String, dynamic> map = {
      'i_page_count': 20,
      'i_page_number': page_number
    };
    listCurrencies = await CurrencyRepo.instance.getCurrencyRequest(map: map);
    isLoadingRequest = false;
    update();
  }

  addLoadMoreTrigger(){
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        loadMore();
      }
    });
  }
  bool stopLoadMore =false;

  onRefresh(){
    listCurrencies.clear();
    page_number = 1 ;
    stopLoadMore = false;
    getCurrencies();
  }

  void loadMore() async {
    if(stopLoadMore) return;
    List<TCurrency> loadMoreList=[];
    page_number += 1;
    // isLoadingRequest = true;
    // update();

    Map<String, dynamic> map = {
      'i_page_count': 20,
      'i_page_number': page_number
    };
    loadMoreList = await CurrencyRepo.instance.getCurrencyRequest(map: map);

    if(loadMoreList.isEmpty)stopLoadMore =true;

    listCurrencies.addAll(loadMoreList);
    // isLoadingRequest = false;
    update();
  }
}