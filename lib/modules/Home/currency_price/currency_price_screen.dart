
import 'package:coinz/controller/currency_controller.dart';
import 'package:coinz/modules/Home/currency_price/widgets/sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class CurrencyPriceScreen extends StatelessWidget {
  CurrencyxController homeController = Get.put(CurrencyxController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(body: GetBuilder<CurrencyxController>(
        builder: (controller) {
          return SafeArea(
              child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      buildSliverAppBar(context),
                      // SliverAppBar #1
                      buildSliverAppBarOne(controller),
                      // SliverAppBar #2
                      buildSliverAppBarTwo(),
                    ];
                  },
                  body: SizedBox(
                      child: controller.isLoadingRequest
                          ? _buildLoading()
                          : _buildMainBody()
                  )));
        },
      )),
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
                return Container(
                    padding: const EdgeInsetsDirectional.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Container(
                                  child: Image.network(
                                '${homeController.listCurrencies[index].sIcon}',
                                height: 20,
                                width: 10,
                              )),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                '${homeController.listCurrencies[index].sName}',
                                style: TextStyle(
                                  fontSize: 12
                                ),

                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${homeController.getValueOfCoinz(index)}'
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(
                                '${homeController.getTradingOfCoinz(index)}',
                                style: TextStyle(
                                  color: homeController.getTradingOfCoinz(index).indexOf('.')==-1?
                                  Colors.green: Colors.red,
                                )))
                      ],
                    ));
              },
            ),
    );
  }
}
