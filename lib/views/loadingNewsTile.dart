import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/views/shimmerapplycontainer.dart';

import '../uihelper/uihelper.dart';

class LoadingNewsTile extends StatelessWidget {
  const LoadingNewsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      height: 130,
      width: 390,
      decoration: BoxDecoration(
          color: Color(0xff76d7c4),
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
          // Gap(3),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ShimmerApplyContainer(width: 120, height: 105),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(10),
                Flexible(
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        ShimmerApplyContainer(width: 30, height: 30),
                        Gap(10),
                        ShimmerApplyContainer(width: 50, height: 15),
                      ],
                    ),
                  ),
                ),
                Gap(8),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ShimmerApplyContainer(width: MediaQuery.of(context).size.width/2,
                        height: 15)
                ),
                Gap(5),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ShimmerApplyContainer(width: MediaQuery.of(context).size.width/2,
                        height: 15)
                ),
                Gap(15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:ShimmerApplyContainer(width: 50, height: 12),

                )
              ],
            ),
          )



        ],
      ),
    );
  }
}
