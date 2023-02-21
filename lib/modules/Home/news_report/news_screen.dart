import 'package:coinz/controller/news_controller.dart';
import 'package:coinz/modules/Home/news_report/module/news_details.dart';
import 'package:coinz/modules/Home/news_report/widgets/buildItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../Shared/components/components.dart';
class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);

  NewsxController controller = Get.put(NewsxController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: GetBuilder<NewsxController>(
            builder: (controller) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'أخبار وتقارير',
                    style: TextStyle(
                        fontSize: 20,
                      fontFamily: 'Swissra',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.separated(
                        padding: EdgeInsetsDirectional.all(5),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              NavigatorTo(
                                  context,
                                  NewsDetails(
                                    '${controller.listNews[index].sTitle}',
                                    '${controller.listNews[index].sImage}',
                                    '${controller.listNews[index].dtCreatedDate}',
                                    '${controller.listNews[index].sDescription}',
                                  ));
                            },
                            child: buildItem(context, index)),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemCount: controller.listNews.length),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
