import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/views/shimmerapplycontainer.dart';


class LoadingTrendingCard extends StatelessWidget {
  const LoadingTrendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container (
      margin: EdgeInsets.only(right: 9),
      height: 370,
      width: 280,
      decoration: BoxDecoration(
          color: Color(0xff1abc9c),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Gap(10),
            ShimmerApplyContainer(width: 270, height: 220),
            Gap(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerApplyContainer(width: 40, height: 10),
                  ShimmerApplyContainer(width: 40, height: 10),

                ],
              ),
            ),
            Gap(20),
            ShimmerApplyContainer(width: MediaQuery.of(context).size.width / 1.5,
                height: 15),
            Gap(7),
            ShimmerApplyContainer(width: MediaQuery.of(context).size.width / 2,
                height: 15),
            Gap(10),


            Row(
              children: [
                ShimmerApplyContainer(width: 30, height: 30),
                Gap(10),
                ShimmerApplyContainer(width: 50, height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
