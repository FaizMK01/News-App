import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../uihelper/uihelper.dart';

class NewsTile extends StatelessWidget {
  final String imageUrl,author,title,time;
  final VoidCallback onTap;
   NewsTile({super.key, required this.imageUrl, required this.author, required this.title, required this.time, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        height: 130,
        width: 390,
        decoration: BoxDecoration(
            color: Color(0xff148f77),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
           // Gap(3),
            Container(
              padding: EdgeInsets.only(left: 10),
              height: 105,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(

                    fit: BoxFit.cover,
                    "$imageUrl"),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(10),
                  Flexible(
                    child: Row(
                      children: [
                        Gap(8),
                        CircleAvatar(
                          backgroundColor: Colors.greenAccent,
                          radius: 15,
                          child: Text(author[0]),
                        ),
                        Gap(10),
                        Flexible(child: UiHelper.reusableText("$author",color: Colors.white)),
                      ],
                    ),
                  ),
                  Gap(8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Flexible(child: UiHelper.reusableText("$title",size: 11,color: Colors.white)),
                  ),
                  Gap(10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Flexible(child: UiHelper.reusableText("$time",size: 15,color: Colors.deepOrangeAccent)),
                  )
                ],
              ),
            )



          ],
        ),
      ),
    );
  }
}
