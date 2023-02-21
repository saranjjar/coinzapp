import 'package:flutter/material.dart';

import '../../../../Shared/components/components.dart';
import '../../../../controller/currency_controller.dart';
import '../../../../utils/utils.dart';
import '../currencies_screen.dart';
import 'gridItem.dart';

SliverAppBar buildSliverAppBar(BuildContext context) {


  return SliverAppBar(
    pinned: false,
    backgroundColor: Colors.white,
    expandedHeight: 80.0,
    flexibleSpace: FlexibleSpaceBar(
      background: Padding(
        padding: const EdgeInsets.only(
            top: 10, right: 10, left: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'أسعار العملات',
                  style: TextStyle(
                      fontSize: 20,
                    fontFamily: 'Swissra',
                  ),
                ),
                Row(
                  children: [
                    Text('آخر تحديث',style: TextStyle(
                      fontFamily: 'Swissra',
                      fontSize: 12
                    ),),
                    SizedBox(
                      width: 5,
                    ),
                    Text('$formatter'),
                  ],
                ),
              ],
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                NavigatorTo(context, CurrenciesScreen());
              },
              child: Text(
                'اضافة للمفضلة',
              ),
            )
          ],
        ),
      ),
      title: Text(''),
    ),
  );
}

SliverAppBar buildSliverAppBarOne(CurrencyxController controller) {
  List<Widget> favList = [];
  return SliverAppBar(
    pinned: false,
    backgroundColor: Colors.white,
    expandedHeight: 250.0,
    flexibleSpace: FlexibleSpaceBar(
      background: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 320 / 200,
        shrinkWrap: true,
        crossAxisSpacing: 10,
        padding: EdgeInsetsDirectional.all(10),
        children: List.generate(controller.fav.length, (index)
        {
         return gridItem(index, controller.fav[index]);
        }),
      ),
      // List.generate(
      //     controller.fav.length, (index) =>
      // (index<= controller.fav.length-1||controller.fav.isEmpty)?GestureDetector(
      //   onTap: (){
      //     NavigatorTo(context, CurrenciesScreen());
      //   },
      //   child: addFavItem(),
      // ):gridItem(index, controller.fav[index])
      //
      // )

      title: Text(''),
    ),
  );
}

SliverAppBar buildSliverAppBarTwo() {
  return SliverAppBar(
    pinned: true,
    backgroundColor: Colors.grey[200],
    expandedHeight: 10.0,
    title: Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
                child: Text(
                  "العملة",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black,
                      fontFamily: 'Swissra',
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                child: Text(
                  "السعر",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black,
                    fontFamily: 'Swissra',
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                child: Text(
                  "التداول",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black,
                    fontFamily: 'Swissra',
                  ),
                )),
          ),
        ],
      ),
    ),
  );
}
