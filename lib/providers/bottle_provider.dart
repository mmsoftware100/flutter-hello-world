

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../data/bottle.dart';

class BottleProvider extends ChangeNotifier{
  // state
  List<Bottle> bottleList = [
    /*
    Bottle(photoUrl: "assets/images/drink_1.jpeg", name: "Bacadi Limon 1", price: 20000, favourite: true),
    Bottle(photoUrl: "assets/images/drink_2.webp", name: "Grand Royal 2", price: 15000, favourite: false),
    Bottle(photoUrl: "assets/images/drink_1.jpeg", name: "Bacadi Orange 3", price: 20000, favourite: false),
    Bottle(photoUrl: "assets/images/drink_2.webp", name: "Grand Royal Signature 4", price: 15000, favourite: true),

     */
  ];

  Bottle bottle = Bottle(photoUrl: "assets/images/drink_1.jpeg", name: "Bacadi Limon", price: 20000, favourite: true, id: 0);


  // modifier
  void toggleFav(String bottleName){
    print("toggleFav $bottleName");
    for(int i=0; i < bottleList.length; i++){
      if(bottleList[i].name == bottleName){
          print("we found $bottleName");
          print(bottleList[i].favourite);
          bottleList[i].favourite = !bottleList[i].favourite;
          print(bottleList[i].favourite);
          notifyListeners();
      }
    }
  }

  void updateSingleBottle(Bottle selectedBottle){
    bottle = selectedBottle;
    notifyListeners();
  }

  Future<bool> getBottleListFromAPI() async{
    // TODO
    // 1. request bottle list api GET
    // 2. assign response json to bottleList
    // 3. notify listener


    bottleList.clear();




    print("BottleProvider->getBottleListFromAPI");
    Dio client = Dio();
    // String endPoint = "https://dr-token.web.app/bottles.json";
    String endPoint = "http://192.168.137.63:3000//bottles.json";

    try{
      Response<dynamic> response = await client.get(endPoint);
      List<dynamic> dataList = response.data;
      for(int i=0; i < dataList.length; i++){

        // Bottle newBottle = Bottle.fromJson(dataList[i]);
        // Bottle newBottle = Bottle.fromJson(dataList[i]);

        /*

        Bottle newBottle = Bottle(
          id: dataList[i]['id'],
          photoUrl: dataList[i]['photo_url'],
          name: dataList[i]['name'],
          price: dataList[i]['price'],
          favourite: dataList[i]['favourite'],
        );

         */
        bottleList.add(Bottle.fromJson(dataList[i]));
      }
      notifyListeners();
    } catch( exp, stackTrace){
      print("BottleProvider->API exception");
      print(exp);
      print(stackTrace);
    }




    // convert to json
    /*
    var jsonData = jsonDecode(response.toString());
    print(jsonData);
    print(jsonData.runtimeType);

     */
    return true;
  }

  int add(int x, int y){
    int result = x + y;
    return result;
  }

  Future<int> addtion({ required int x, required int y}){
    int result = x + y;
    return Future.delayed(Duration(seconds: 3),(){
      return result;
    });
    // return result;
  }


}