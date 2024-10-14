import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../uihelper/uihelper.dart';

class TrendingCard extends StatelessWidget {

  final String imageUrl,title,tage,time,author;
  final  VoidCallback onTap;


   const TrendingCard({super.key, required this.imageUrl, required this.title, required this.tage, required this.time, required this.author,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container (
        margin: EdgeInsets.only(right: 9),
        height: 370,
        width: 280,
        decoration: BoxDecoration(
            color: Color(0xff48c9b0),
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Gap(6),
            Container(
              padding:EdgeInsets.only(top:  5),
              height: 240,
              width: 260,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                    fit: BoxFit.cover,
                  imageUrl
                ),
              ),
            ),
            Gap(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text("$tage",maxLines: 2,style: TextStyle(
                    color: Colors.black,fontWeight: FontWeight.bold
                  ),),
                  ),
                  UiHelper.reusableText(time,color: Colors.white),

                ],
              ),
            ),
            Gap(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                maxLines: 2,
                title,style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),)

            ),
            Gap(7),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    radius: 15,
                    child: Text(author[0]),
                  ),
                  Gap(10),
                  Flexible(child: UiHelper.reusableText(author,color: Colors.white))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
