import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/views/articles/articleview.dart';
import 'package:news_app/views/homepage.dart';

class BottomNavController extends GetxController{


  RxInt index = 0.obs;

  var pages = [
    HomePage(),
    ArticleView(),

  ];


}