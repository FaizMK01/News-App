import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/newsController.dart';
import 'package:news_app/widgets/newsTile.dart';

import '../newsDetail/newsDetails.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
            ),

          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Search news",
                  suffixIcon: Obx(() => controller.forYouNews.value
                      ? Column(
                    children: [
                      // Loading tiles
                    ],
                  )
                      : InkWell(
                    onTap: () {
                      controller.searchNews(searchController.text);
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      child: Icon(Icons.search),
                    ),
                  )),
                ),
              ),
            ),
            Gap(20),
            Obx(
                  () => Column(
                children: controller.forYouList.map(
                      (e) => NewsTile(
                    imageUrl: e.urlToImage ?? "https://www.example.com/fallback.jpg",
                    title: e.title ?? "Default title",
                    time: e.publishedAt ?? "2 Days ago",
                    author: e.author ?? "Unknown",
                    onTap: () {
                      // Navigate to NewsDetails with the selected news item
                      Get.to(NewsDetails(news: e));
                    },
                  ),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
