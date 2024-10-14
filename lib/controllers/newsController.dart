import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/CrunchNewsModel.dart';

class NewsController extends GetxController{

  RxList<CrunchNewsModel> crunchList = <CrunchNewsModel>[].obs;
  RxList<CrunchNewsModel> forYouList = <CrunchNewsModel>[].obs;
  RxList<CrunchNewsModel> forYouList8 = <CrunchNewsModel>[].obs;
  RxList<CrunchNewsModel> teslaList = <CrunchNewsModel>[].obs;
  RxList<CrunchNewsModel> teslaList5 = <CrunchNewsModel>[].obs;

  FlutterTts flutterTts = FlutterTts();


  RxBool crunchNews = false.obs;
  RxBool forYouNews = false.obs;
  RxBool teslNews = false.obs;
  RxBool speakNews = false.obs;





  @override
  void onInit() async{
    super.onInit();
    crunchGetNews();
    newsForYou();
    teslaNews();
  }

  Future<void> crunchGetNews() async{


    try{
      crunchNews.value = true;

      var url = Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=81c96746f04041e3898925c836be4f41");

      final response = await http.get(url);

      if(response.statusCode==200){
        var data = jsonDecode(response.body);
        var articles = data["articles"];
        crunchNews.value = false;

        for(var news in articles){
          crunchList.add(CrunchNewsModel.fromJson(news));

        }

      }else{

      }

    }catch(e){
      print(e.toString());

    }
    crunchNews.value = false;


  }
  Future<void> newsForYou() async{


    try{
      forYouNews.value = true;


      var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=81c96746f04041e3898925c836be4f41");

      final response = await http.get(url);


      if(response.statusCode==200){
        var data = jsonDecode(response.body);
        var articles = data["articles"];
        forYouNews.value = false;

        for (var news in articles) {
          forYouList.add(CrunchNewsModel .fromJson(news));
        }
        forYouList8.value = forYouList.sublist(0,8).obs;


      }

    }catch(e){
      print(e.toString());

    }
    forYouNews.value = false;


  }
  Future<void> teslaNews() async{


    try{

      teslNews.value = true;

      var url = Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2024-09-14&sortBy=publishedAt&apiKey=81c96746f04041e3898925c836be4f41");

      final response = await http.get(url);


      if(response.statusCode==200){
        var data = jsonDecode(response.body);
        var articles = data["articles"];
        teslNews.value = false;

        for (var news in articles) {
          teslaList.add(CrunchNewsModel .fromJson(news));
        }
        teslaList5.value = teslaList.sublist(0,6).obs;


      }

    }catch(e){
      print(e.toString());

    }
    teslNews.value = false;

  }

  Future<void> searchNews(String search) async{


    try{

      forYouNews.value = true;

      var url = Uri.parse("https://newsapi.org/v2/everything?q=$search&apiKey=a6f661a17abe4f5ca3c5c2ea83cf1c73");

      final response = await http.get(url);


      if(response.statusCode==200){
        var data = jsonDecode(response.body);
        var articles = data["articles"];
        forYouList.clear();
        int i = 0 ;
        forYouNews.value = false;

        for (var news in articles) {
          forYouList.add(CrunchNewsModel .fromJson(news));
          if(i == 10){
            break;
          }
        }


      }

    }catch(e){
      print(e.toString());

    }
    forYouNews.value = false;

  }

  Future<void> speak(String text) async{

    speakNews.value = true;

    await flutterTts.setLanguage("en-US");

    await flutterTts.setSpeechRate(0.5);

    await flutterTts.setVolume(1.0);

    await flutterTts.setPitch(1);

    await flutterTts.speak(text);

    speakNews.value = true;


  }

  void stop() async{
    flutterTts.stop();
    speakNews.value = false;
  }



}