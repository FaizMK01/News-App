import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/controllers/controller.dart';
import 'package:news_app/widgets/bottomNav.dart';

class HomeController extends StatelessWidget {
  const HomeController({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Scaffold(
      floatingActionButton: BottomNav(),
      body: Obx(()=>controller.pages[controller.index.value])
    );
}
}
