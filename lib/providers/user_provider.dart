import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:state/data/user.dart';

class UserProvider extends ChangeNotifier{

  // state
  User user = User(fullName: "", password: "", email: "");
  String status = "";
  String errorMessage = "";

  Future<bool> login({required String username, required String password})async{
    // make api request

    status = "loading";
    errorMessage = "";
    notifyListeners();



    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic MTEyMDIxMTg6NjAtZGF5ZnJlZXRyaWFs'
    };
    var data = json.encode({
      "usergemail": username,
      "password": password
    });
    var dio = Dio();
    var response = await dio.request(
      'http://zaw533150-001-site1.ltempurl.com/login/user',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));

      user = User.fromJson(response.data);
      status = "success";
      errorMessage = "";
      notifyListeners();


      return true;

    }
    else {
      print(response.statusMessage);
      status = "error";
      errorMessage = response.statusMessage.toString();
      notifyListeners();
      
      return false;
    }
  }

  Future<bool> register({required String username, required String password})async{
    // make api request

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic MTEyMDIxMTg6NjAtZGF5ZnJlZXRyaWFs'
    };
    var data = json.encode({
      "usergemail": username,
      "password": password
    });
    var dio = Dio();
    var response = await dio.request(
      'http://zaw533150-001-site1.ltempurl.com/login/user',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));

      User newUser = User.fromJson(response.data);
      dataList.add(newUser);
      return true;

    }
    else {
      print(response.statusMessage);
      errorMessage = response.statusMessage.toString();
      return false;
    }
  }

  Future<bool> update({required String username, required String password})async{
    // make api request

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic MTEyMDIxMTg6NjAtZGF5ZnJlZXRyaWFs'
    };
    var data = json.encode({
      "usergemail": username,
      "password": password
    });
    var dio = Dio();
    var response = await dio.request(
      'http://zaw533150-001-site1.ltempurl.com/login/user',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));

      User newUser = User.fromJson(response.data);
      dataList.add(newUser);
      return true;

    }
    else {
      print(response.statusMessage);
      errorMessage = response.statusMessage.toString();
      return false;
    }
  }


}