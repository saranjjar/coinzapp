import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/currency_controller.dart';

class CurrenciesScreen extends StatelessWidget {
  CurrencyxController homeController = Get.put(CurrencyxController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: GetBuilder<CurrencyxController>(
          builder: (controller) {
            return SafeArea(
              child: SizedBox(
                  child: controller.isLoadingRequest
                      ? _buildLoading()
                      : _buildMainBody()),
            );

          })),
    );
  }

  Center _buildLoading() {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: Lottie.asset(
          'assets/images/a.json',
        ),
      ),
    );
  }

  RefreshIndicator _buildMainBody() {
    return RefreshIndicator(
      onRefresh: () {
        return homeController.getCurrencies();
      },
      child: homeController.listCurrencies.isEmpty
          ? Text(
        "empty",
        style: TextStyle(fontSize: 50),
      )
          : ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: homeController.listCurrencies.length,
            itemBuilder: (context, index) {
            return GestureDetector(
              onTap:(){
                homeController.getFavoriteCurrency(index);
            },
            child: Container(
                padding: const EdgeInsetsDirectional.all(20),
                child:ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Container(
                                child: Image.network(
                                  '${homeController.listCurrencies[index].sIcon}',
                                  height: 20,
                                  width: 20,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${homeController.listCurrencies[index].sName}',
                            ),
                          ],
                        ),
                      ),
                      // Expanded(
                      //   flex: 1,
                      //   child: Text(
                      //     '${('${homeController.listCurrencies[index].dValue}')}',
                      //   ),
                      // ),
                      // Expanded(
                      //     flex: 1,
                      //     child: Text(
                      //         '${homeController.listCurrencies[index].dTrading}',
                      //         style: TextStyle(
                      //           color: Colors.lightGreen,
                      //         ))),
                    ],
                  ),
                  trailing: Container(
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                        color:homeController.fav.contains(homeController.listCurrencies[index])? Colors.red:Colors.green
                    ),
                    child: Center(
                        child: Text(
                            homeController.fav.contains(homeController.listCurrencies[index])?
                            'حذف':'اضافة',style: TextStyle(
                          color: Colors.white,
                        ),)),
                  ),
                )

            ),
          );
        },
      ),
    );
  }
}


