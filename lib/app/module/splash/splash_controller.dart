import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:agami24/app/core/utils/my_sharedpreferences.dart';
import 'package:agami24/app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTime();
  }

  startTime() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? userId = localStorage.getString(MySharedPreference.sUserId);
    String? token = localStorage.getString(MySharedPreference.sToken);
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // connected
        if(userId != null){
          MySharedPreference.userId = int.parse(userId);
          MySharedPreference.token = token!;
          var duration = const Duration(seconds: 2);
          return Timer(duration, navigationPage);
        } else {
          MySharedPreference.userId = 0;
          MySharedPreference.token = "";
          var duration = const Duration(seconds: 2);
          return Timer(duration, navigationLogin);
        }
      }else{
        // not connected
        var duration = const Duration(seconds: 2);
        return Timer(duration, noInternetPage);
      }
    } on SocketException catch (_) {
      if (kDebugMode) {
        print('not connected');
      }
      var duration = const Duration(seconds: 2);
      return Timer(duration, noInternetPage);
    }
  }

  void navigationPage() {
    Get.offAllNamed(Routes.HOME);
  }

  void navigationLogin() {
    Get.offAllNamed(Routes.LOGIN);
  }

  void noInternetPage() {
    Get.offAllNamed(Routes.NO_INTERNET);
  }

  @override
  void onClose() {

    super.onClose();
  }
}