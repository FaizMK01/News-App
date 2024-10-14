import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerApplyContainer extends StatelessWidget {
  final double height,width;
   const ShimmerApplyContainer({super.key,required this.width,required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.blueGrey,
        highlightColor: Colors.black45,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),

        ),
      ),

    );
  }
}
