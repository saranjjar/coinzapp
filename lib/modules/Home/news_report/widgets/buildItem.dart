import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinz/controller/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

NewsxController controller = Get.find<NewsxController>();

Widget buildItem(context,index){
  return InkWell(
    child: Material(
      elevation: 1,
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),),
                    child:CachedNetworkImage(
                      imageUrl: '${controller.listNews[index].sImage}',
                      placeholder: (context, url) => Image(
                          image: NetworkImage(''
                              'https://cloudinary.hbs.edu/hbsit/image/upload/s--Fm3oHP0m--/f_auto,c_fill,h_375,w_750,/v20200101/79015AB87FD6D3284472876E1ACC3428.jpg'
                          ),
                        fit: BoxFit.cover,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.contain,
                    ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${controller.listNews[index].sTitle}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12,fontFamily: 'Swissra',),
                    ),
                  ),
                  Text(
                    '${controller.listNews[index].dtCreatedDate}',
                    maxLines: 1,
                    style:
                    TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}