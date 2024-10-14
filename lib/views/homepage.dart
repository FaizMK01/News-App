import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/controllers/newsController.dart';
import 'package:news_app/models/NewsForYouModel.dart';
import 'package:news_app/uihelper/uihelper.dart';
import 'package:news_app/views/loadingNewsTile.dart';
import 'package:news_app/views/loadingTrendingCard.dart';
import 'package:news_app/views/newsDetail/newsDetails.dart';
import 'package:news_app/widgets/newsTile.dart';
import 'package:news_app/widgets/trendingCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Icon(Icons.dashboard),
                  ),
                  UiHelper.reusableText("News App",size: 25,color: Colors.black),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
      
                    ),
                    child: Icon(Icons.person),
                  )
                ],
              ),
              Gap(40),
      
      
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UiHelper.reusableText("Trending News"),
                  UiHelper.reusableText("See All")
                ],
              ),
              const Gap(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Obx(()=>controller.crunchNews.value?Row(
                  children: [
                    LoadingTrendingCard(),
                    LoadingTrendingCard(),

                  ],
                ):Row(
                  children: controller.crunchList
                      .map(
                        (e) => TrendingCard(
                      onTap: () {
                        Get.to(NewsDetails(news: e));
                      },
                      imageUrl: e.urlToImage!,
                      title: e.title ?? "No Title",
                      tage: "Trending 1",
                      time: e.publishedAt!,
                      author: e.author ?? "No Author",
                    ),
                  )
                      .toList(),
                ),
                ),
              ),

                  const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UiHelper.reusableText("News For You"),
                  UiHelper.reusableText("See All")
                ],
              ),
              Gap(10),
             Obx(()=> controller.forYouNews.value?Column(
               children: [
                 LoadingNewsTile(),
                 LoadingNewsTile(),
                 LoadingNewsTile(),
               ],
             ):Column(
               children: controller.forYouList8
                   .map(
                     (e) => NewsTile(
                   onTap: () {
                     Get.to(NewsDetails(news: e));
                   },

                   imageUrl: e.urlToImage ?? 'https://s.hdnux.com/photos/01/44/06/63/26242295/5/rawImage.jpg',
                   author: e.author ?? 'Unknown Author',                                // Fallback if author is null
                   title: e.title ?? 'No Title Available',                              // Fallback if title is null
                   time: e.publishedAt ?? 'Unknown Date',                              // Fallback if date is null
                 ),
               )
                   .toList(),
             ),
             ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UiHelper.reusableText("Tesla News"),
                  UiHelper.reusableText("See All")
                ],
              ),
              Gap(10),

              Obx(()=> controller.teslNews.value?Column(
                children: [

                  LoadingNewsTile(),
                  LoadingNewsTile(),
                  LoadingNewsTile(),

                ],
              ):Column(
                children: controller.teslaList5
                    .map(
                      (e) => NewsTile(
                    onTap: () {
                      Get.to(NewsDetails(news: e));
                    },

                    imageUrl: e.urlToImage ?? 'https://www.motherjones.com/wp-content/uploads/2024/10/241008_Elon.jpg?w=1200&h=630&crop=1',
                    author: e.author ?? 'Unknown Author',                                // Fallback if author is null
                    title: e.title ?? 'No Title Available',                              // Fallback if title is null
                    time: e.publishedAt ?? 'Unknown Date',                              // Fallback if date is null
                  ),
                )
                    .toList(),
              ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
