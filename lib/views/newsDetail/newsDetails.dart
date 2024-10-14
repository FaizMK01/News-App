import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/controllers/newsController.dart';
import 'package:news_app/models/CrunchNewsModel.dart';

import '../../uihelper/uihelper.dart';

class NewsDetails extends StatelessWidget {
  final CrunchNewsModel news;
  const NewsDetails({super.key,required this.news});

  @override
  Widget build(BuildContext context) {
    
    NewsController controller = Get.put(NewsController());
    
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new),
                      Gap(3),
                      Text("Back")
                    ],
                  ),
                ),
              )
            ],
          )
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    fit: BoxFit.cover,
                    news.urlToImage ?? "https://images.wsj.net/im-83516560/social",

                  )),
            ),
            Gap(20),
            UiHelper.reusableText("Title"),
            Gap(10),


            UiHelper.reusableText(news.title!,size: 25),
            Gap(15),

            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  UiHelper.reusableText(news.publishedAt!),

                ],
              ),
            ),
            Gap(8),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                child: Text(news.author![0],)
                ),
                Gap(20),
                UiHelper.reusableText(news.author!,size: 18),

              ],
            ),
            Gap(20),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              child: Row(
                children: [
                  Obx(()=>controller.speakNews.value? IconButton(onPressed: (){
                    controller.stop();
                  },
                      icon: Icon(Icons.stop,size: 50,),
                  ):IconButton(onPressed: (){


                    controller.speak(news.description ??  "No Description");



                  },
                    icon: Icon(Icons.play_arrow,
                      size: 50,
                    ),
                  ),
                  ),
                  Obx(()=>
                      Expanded(
                          child: Lottie.asset(
                      "assets/a.json",
                      height: 70,
                      width: 100,
                      animate: controller.speakNews.value
                  ),
                      ),
                  ),

                ],
              ),
            ),
            Gap(20),
            UiHelper.reusableText("Discription",size: 20),
            Gap(10),
            UiHelper.reusableText(news.description!),


          ],
        ),
      ),
    );
  }
}
