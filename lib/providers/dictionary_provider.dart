import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:state/data/definition.dart';
import 'package:state/data/dictionary.dart';
import 'package:state/data/meaning.dart';

class DictionaryProvider extends ChangeNotifier{
  List<Dictionary> dictionaryList = [
    /*
    Dictionary(
        word: "hello",
        meanings: [
          Meaning(
              partOfSpeech: "noun",
              definitions: [
                Definition(definition: "greeting"),
                Definition(definition: "မင်္ဂလာပါ"),
              ]
          ),
          Meaning(
              partOfSpeech: "verb",
              definitions: [
                Definition(definition: "နှုတ်ဆက်သည်"),
                Definition(definition: "ယဉ်ကျေးပျူငှာသည်"),
              ]
          )
        ]
    ),
    Dictionary(
        word: "bye",
        meanings: [
          Meaning(
              partOfSpeech: "noun",
              definitions: [
                Definition(definition: "end greeting"),
                Definition(definition: "တာ့ တာ"),
              ]
          ),
          Meaning(
              partOfSpeech: "verb",
              definitions: [
                Definition(definition: "နှုတ်ဆက်ထွက်ခွာသည်"),
                Definition(definition: "ထွက်ခွာသည်"),
              ]
          )
        ]
    ),
    
     */
  ];

  Future<bool> getMeaning(String word) async{
    dictionaryList.clear();

    Dio client = Dio();
    String endPoint="https://api.dictionaryapi.dev/api/v2/entries/en/$word";
    try{
      Response<dynamic> response = await client.get(endPoint);
      List<dynamic> dataList = response.data;
      for(int i=0;i<dataList.length;i++) {
        Dictionary newDict = Dictionary.fromJson(dataList[i]);
        dictionaryList.add(newDict);
      }
      notifyListeners();
      return true;
    }
    catch (exp, stackTrace){
      print("DictionaryProvider->API exception");
      print(exp);
      print(stackTrace);
      return false;
    }
  }
}