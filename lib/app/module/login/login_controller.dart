import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:agami24/app/core/utils/my_sharedpreferences.dart';
import 'package:agami24/app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/urls.dart';

class LoginController extends GetxController{
  var isLoading = false.obs;

  var userController = TextEditingController();
  var passwordController = TextEditingController();
  String user = "";
  String password = "";

  String? validationUser(String? value){
    if(value == null || value.isEmpty){
      return "Enter User";
    } else {
      return null;
    }
  }

  String? validationPassword(String? value){
    if(value == null || value.isEmpty){
      return "Enter Password";
    } else if(value.length < 5){
      return "Password too short";
    } else {
      return null;
    }
  }

  void login() async {
    isLoading.value = true;
    update();
    Client client = Client();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    Uri url = Uri.parse(Urls.baseUrl+Urls.login);
    try{
      var response = await client.post(url,body: {'username': user,"password": password},headers: {
        "Accept":"application/json"
      });
      print(response.body);
      if (response.statusCode == 200) {
        final Map<String, dynamic> body = await json.decode(response.body);
        if (response.body.isNotEmpty) {
          if(body["error"] == false){
            //todo change.........
            Get.offAllNamed(Routes.HOME);
          } else {
            Get.snackbar("Login Message", body["msg"],snackPosition: SnackPosition.BOTTOM);
          }
        }
      }else {
        throw Exception('Failed to load post');
      }
      isLoading.value = false;
      update();
    }on Exception catch(e){
      print(e);
      isLoading.value = false;
      update();
    }
  }
}