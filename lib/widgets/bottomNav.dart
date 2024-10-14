import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/controllers/controller.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xffabb2b9),

              borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

               Obx(()=> InkWell(
                 onTap:(){
                   controller.index.value = 0;
                 },
                 child: AnimatedContainer(
                   duration: Duration(milliseconds: 400),
                   curve: Curves.easeInBack,
                   decoration: BoxDecoration(
                       color: controller.index.value == 0? Colors.white:null,
                       borderRadius: BorderRadius.circular(10)
                   ),
                   height: 28,
                   child: Center(
                     child: Icon(
                         Icons.home,
                       color: controller.index.value == 0?Colors.red:Colors.black,
                     ),
                   ),
                 ),
               ),),
               Obx(()=> InkWell(
                 onTap:(){
                   controller.index.value=1;
                 },

                 child: AnimatedContainer(
                   duration: Duration(milliseconds: 400),
                   curve: Curves.easeInBack,

                   decoration: BoxDecoration(
                       color: controller.index.value == 1? Colors.white:null,

                       borderRadius: BorderRadius.circular(10)
                   ),
                   height: 28,
                   child: Center(
                     child: Icon(Icons.book,
                       color: controller.index.value == 1?Colors.red:Colors.black,

                     ),
                   ),
                 ),
               ),),

              ],
            ),
          ),

        )
      ],
    );
  }
}
