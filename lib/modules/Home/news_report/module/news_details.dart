
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../Shared/color.dart';
import '../../../../Shared/components/components.dart';

class NewsDetails extends StatelessWidget {

  final String title;
  final String image;
  final String date;
  final String description;
  const NewsDetails(this.title,this.image,this.date,this.description, {super.key});

  @override
  Widget build(BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: TextButton(
                child: const Text(
                  'عودة',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'مشاركة',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${title}',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${date}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: '${image}',
                    placeholder: (context, url) => const Image(
                      image: NetworkImage(''
                          'https://cloudinary.hbs.edu/hbsit/image/upload/s--Fm3oHP0m--/f_auto,c_fill,h_375,w_750,/v20200101/79015AB87FD6D3284472876E1ACC3428.jpg'
                      ),
                      fit: BoxFit.cover,
                    ),
                    errorWidget: (context, url, error) => const Image(image: NetworkImage('https://cloudinary.hbs.edu/hbsit/image/upload/s--Fm3oHP0m--/f_auto,c_fill,h_375,w_750,/v20200101/79015AB87FD6D3284472876E1ACC3428.jpg')),
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: D_MaterialButton(
                                  onPressed: () {},text: 'مشاركة عبر الفيسبوك',
                                  color: Colors.blue
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                flex: 2,
                                child: D_MaterialButton(
                                  onPressed: () {},text: 'مشاركة عبر التويتر',
                                  color: Colors.cyan
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                flex: 1,
                                  child: MaterialButton(
                                    color: offwhite,
                                    onPressed: (){},child: const Icon(Icons.share,color: Colors.black38,),))
                            ],
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'باستثناء عملة الريبل والتي أظهرت أداءاً ضعيفاً طوال الأسابيع القليلة الماضية، فإن العملات الرقمية الرئيسية في السوق بما في ذلك البيتكوين والاثيريوم وكاردانو قد ارتفعت قيمتها. وفي غضون الـ 24 ساعة الماضية، ازداد سعر البيتكوين بنسبة 8% وارتفعت قيمة الإيثر بنسبة 10%، كما وارتفعت قيمة كاردانو بنسبة 15%. وبينما انخفض سعر العملات الثلاث بهامش ضئيل في الثلاث ساعات الماضية، إلا أنهم لا زالوا يسجلون مكاسب يومية كبيرة نسبياً.'
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
}
